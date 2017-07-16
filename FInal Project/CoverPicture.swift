//
//  CoverPicture.swift
//  FInal Project
//
//  Created by Student on 2017-05-15.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import CoreData

class CoverPicture: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //info sent
    var properties:[String]!
    var numProperties: [Int]!
    
    //Image view
    @IBOutlet var imageview: UIImageView!
    
    // variable to choose image
    var imagePicker: UIImagePickerController!
    
    //buttons
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var skipButton: UIBarButtonItem!
    @IBOutlet weak var takePhotoButton: UIButton!
    
    //for saving photos
    var imagesDirectoryPath : URL!
    var images : [UIImage]!
    var titles : [String]!
    
    //did come from edit photos?
    var backControllers:Int!
    var book:NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.setHidesBackButton(true, animated:true)
        self.navigationItem.leftBarButtonItem = skipButton
        self.navigationItem.rightBarButtonItem = saveButton
        
        //path of document folder for saving of images
        
        images = []
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        // Get the Document directory path
        let documentDirectoryPath = paths[0]

        // If the folder with the given path doesn't exist already, create it
        if FileManager.default.fileExists(atPath: documentDirectoryPath.path) {
            print("file exists")
        } else {
            do{
                try FileManager.default.createDirectory(atPath: documentDirectoryPath.path, withIntermediateDirectories: true, attributes: nil)
            }catch{
                print("Something went wrong while creating a new folder")
            }
        }
        
        imagesDirectoryPath = documentDirectoryPath
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Take photo button
    @IBAction func takephoto(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
        
            imagePicker =  UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        
        // Save image to Document directory
        
        guard imageview.image != nil else {
            
            self.showErrorAlert(message: "You didn't take a picture!", description: "Click on 'Take Cover Photo' to take a picture or press 'Skip'")
            return
        }
        
        
        var imagePath = NSDate().description
        imagePath = imagePath.replacingOccurrences(of: " ", with: "") + ".png"
        let completeImagePath = imagesDirectoryPath.appendingPathComponent(imagePath)
        print(completeImagePath)
        print("The image path is \(imagePath)")
        let data = UIImagePNGRepresentation(imageview.image!)
        let success = FileManager.default.createFile(atPath: completeImagePath.path, contents: data, attributes: nil)
        
        if backControllers == 4 {
        //save all properties
        save(name: properties[0], author: properties[1], pagesTotal: numProperties[0], hoursRead: numProperties[1], minutesRead: numProperties[2], pagesRead: numProperties[3], path: imagePath)
        } else {
            
            saveOne(imagePath: imagePath)
        }
        
        // - change so that it only goes back three IF it came directly from bookInfo: only ONE if came from edit book Info??
        exitControllers(numControllers: backControllers)
    }
    
    
    
    @IBAction func skipClicked(_ sender: Any) {
        
        if backControllers == 4 {
            //save all properties
            save(name: properties[0], author: properties[1], pagesTotal: numProperties[0], hoursRead: numProperties[1], minutesRead: numProperties[2], pagesRead: numProperties[3], path: "")
        }
        
        exitControllers(numControllers: backControllers)
    }
    
    //pop back three view controllers (so -4 or -2)
    func exitControllers(numControllers: Int) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController];
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - numControllers], animated: true);
    }

    func saveOne(imagePath: String) {
        
        //making sure that you're using correct AppDelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        //get context
        let managedContext = appDelegate.persistentContainer.viewContext
        
        book.setValue(imagePath, forKey: "imagePath")
        
        //try to save
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    //function saves text field info to core data
    func save(name: String, author: String, pagesTotal: Int, hoursRead: Int, minutesRead: Int, pagesRead: Int, path: String) {
        
        //making sure that you're using correct AppDelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        //get context
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //get correct entity
        let entity = NSEntityDescription.entity(forEntityName: "Books",
                                                in: managedContext)!
        
        //new object
        let book = NSManagedObject(entity: entity,
                               insertInto: managedContext)
        
        print(path)
        book.setValue(name, forKey: "name")
        book.setValue(author, forKey: "author")
        book.setValue(pagesTotal, forKey: "pages")
        book.setValue(hoursRead, forKey: "hoursRead")
        book.setValue(minutesRead, forKey: "minutesRead")
        book.setValue(pagesRead, forKey: "pagesRead")
        book.setValue(path, forKeyPath: "imagePath")
        book.setValue(1, forKey: "starRating")
        book.setValue(false, forKey: "tag")
        book.setValue(false, forKey: "coolTag")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]) {
        
        imageview.contentMode = .scaleAspectFit
        imageview.image = image.correctlyOrientedImage()
        self.dismiss(animated: true, completion: nil)
        
        var photosTaken = UserDefaults.standard.integer(forKey: "PhotosTaken")
        photosTaken += 1
        UserDefaults.standard.set(photosTaken, forKey: "photosTaken")
        print("This is the counter number for photos taken: \(photosTaken)")
        
        switch photosTaken {
            
        case 1, 2, 10:
            
            print("yes, its one, or two or whatnot")
            reachedAchievementAlert(title: "You achieved the PhotosTaken Achivement!", message: "You took \(photosTaken) photo(s)!", image: "", currentView: self)
            
        default:
            break
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
