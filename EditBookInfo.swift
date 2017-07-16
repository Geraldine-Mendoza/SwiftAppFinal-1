//
//  EditBookInfo.swift
//  FInal Project
//
//  Created by Student on 2017-05-28.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import CoreData

class EditBookInfo: UIViewController {

    var bookInfo = [String]()
    var book: NSManagedObject!
    
    //buttons and text fields
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var authorField: UITextField!
    @IBOutlet weak var changeImageButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("We will edit these properties: \(bookInfo)")
        
        setUpPrevious()
        
        self.navigationItem.setHidesBackButton(true, animated:true);
        
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //sets info as the one we currently have
    func setUpPrevious() {
        
        print("in setUpPrevious()")
        
        /*
        guard let name = book.value(forKey: "name") as? String, let author = book.value(forKey: "author") as? String, let image = book.value(forKey: "image") as? String else {
            return
        }
 */
        nameField.text = book.value(forKey: "name") as? String
        authorField.text = book.value(forKey: "author") as? String
    }
    
    
    //when done button is clicked, we make sure correct fields are entered and save this new info
    @IBAction func doneClicked(_ sender: Any) {
        
        guard let name = nameField.text, name.isEmpty == false else {
            showErrorAlert(message: "Add a book title!", description: "The field is empty.")
            return
        }
        
        guard let Author = authorField.text, Author.isEmpty == false else {
            showErrorAlert(message: "Author field", description: "So the book wrote itself?")
            return
        }
        
        updateRecords(name: name, author: Author)
        
        //this will exit back to the previous view controller (library controller)
        _ = navigationController?.popViewController(animated: true)
    }
    
    func updateRecords(name: String, author: String) {
        
        //change value in core data to the new value
        let moc = getContext()
        
        book.setValue(name, forKey: "name")
        book.setValue(author, forKey: "author")
        //should also set image
        
        do {
            try moc.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    }
    
    //sending info for segue going to cover picture storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //making sure we are using correct segue
        if segue.identifier == "changeImage" {
            
            //selecting the destination controller
            let detailVC: CoverPicture = segue.destination as! CoverPicture
            
            //sending properties to destination view controller
            detailVC.backControllers = 2
            detailVC.book = book
            
        }
    }
    
    // MARK: Get Context
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
}
