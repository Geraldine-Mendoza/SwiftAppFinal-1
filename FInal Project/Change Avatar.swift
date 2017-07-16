//
//  Avatar.swift
//  FInal Project
//
//  Created by Rida Rahman on 2017-05-09.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import CoreData

class ChangeAvatarCollectiveCell: UICollectionViewCell {
    @IBOutlet weak var AvatarImage: UIImageView!
    
}

class ChangeAvatar: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var NameDisplay: UILabel!
    
    // Collection View Within View Controller
    @IBOutlet weak var CollectionView: UICollectionView!
    var UserInfo = NSManagedObject()
    
    // Avatar Images
    
    var AvatarImages = ["Avocado", "Bear", "Cow", "Carrot", "Dolphin", "Dinosaur", "Elephant", "Flamingo", "Fox", "Hippo", "Jellyfish", "Moose", "Monkey", "Octopus", "Pig", "Panda", "Parrot", "Pumpkin", "Popcorn", "Penguin", "Platypus", "Sheep", "Sloth", "Shark", "Wolf"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.dataSource = self
        CollectionView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Create Cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AvatarImages.count //Number of Images
    }
    
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print("in editing for each cell")
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvatarCell", for: indexPath as IndexPath) as! ChangeAvatarCollectiveCell
        //let Avatars = AvatarImages[indexPath.item]
        
        
        
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        //cell.BookCover.image = UIImage(named: arrayBookImages[indexPath.item])
        cell.AvatarImage.image = UIImage(named: AvatarImages[indexPath.item])
        
        print("sheeep")
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        
        
        
        //let passThis = indexPath.item
        if let cell = collectionView.cellForItem(at: indexPath) {
            var avatar = AvatarImages[indexPath.item]
            save (avatar: avatar)
            performSegue(withIdentifier: "IWantToPunchDeathInTheFaceTwice", sender: cell)
        }
    }
    
    // change background color when user touches cell
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor(red: 41/255.0, green: 171/255, blue: 230/255, alpha: 1.0)
        //cell?.textLabel.textColor = UIColor.white
    }
    
    // change background color white when user releases touch
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor(red: 50/255.0, green: 180/255, blue: 250/255, alpha: 1.0)
        //cell.myLabel.textColor = UIColor.black
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // USERNAME DISPLAY BEGINS
        
        //ERROR!!!!!
        
        //reload the data for the collection view
        // NameDisplay.reloadData()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        //getting the managed context where the entity we need is
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //make fetch request
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserInfo")
        
        
        //try to fetch the entity we need, else print error
        do {
            let users = try managedContext.fetch(fetchRequest)
            if let user = users.first {
                Username = user.value(forKey: "name") as! String
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        print("\(Username)")
        NameDisplay.text = "Hello " + Username
        
        
        //USERNAME DISPLAY ENDS
        
        
    }
    
    var Username:String = ""
    // @IBOutlet weak var NameDisplay: UILabel!
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func save(avatar: String) {
        
        //making sure that you're using correct AppDelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        //get context
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //get correct entity
        let entity = NSEntityDescription.entity(forEntityName: "UserInfo", in: managedContext)!
        
        //new object
        UserInfo = NSManagedObject(entity: entity, insertInto: managedContext)
        
        //print("about to save new info for book (first view controller)")
        
        UserInfo.setValue(avatar, forKeyPath: "avatar")
        
        
        do {
            try managedContext.save()
            print("Saved")
        } catch _ as NSError {
            print("Could not save.")
        }
    }
    
}
