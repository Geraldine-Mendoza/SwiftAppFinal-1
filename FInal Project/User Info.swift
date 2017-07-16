//
//  User Info.swift
//  FInal Project
//
//  Created by Rida Rahman on 2017-04-27.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import CoreData


class User_Info: UIViewController {
    
    var UserInfo = NSManagedObject()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    @IBOutlet weak var NameInput: UITextField!
    @IBOutlet weak var NextButton: UIButton!
    
    var username:String = ""
    
    
    // Enables 'Next' button after textfield is edited
    @IBAction func NameEditingDidChange(_ sender: Any) {
        
        NextButton.isEnabled = true
    }
    
    func disable() {
        
        NextButton.isEnabled = false
        
    }
    
    // Once button is pressed
    @IBAction func NextButtonPressed(_ sender: Any) {
        // Gets user's name from textfield
        print("12345abcde")
        
        self.username = NameInput.text!
        
        // If textfield is not empty, moves to next storyboard
        
        if username.isEmpty == false && username != "" {
            
            print("username = \(username)")
            save(username: username)
            //function saves text field info to core data
            // Moves to next view controller
            performSegue(withIdentifier: "fistBump", sender: nil)
            print("Out ")
            
            
        }
        else {
            print("text field is empty")
            NextButton.isEnabled = false
            return
        }
        
    }
    
    func save(username: String) {
        
        //making sure that you're using correct AppDelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        //get context
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //get correct entity
        let entity = NSEntityDescription.entity(forEntityName: "UserInfo",
                                                in: managedContext)!
        
        //new object
        UserInfo = NSManagedObject(entity: entity,
                                   insertInto: managedContext)
        
        //print("about to save new info for book (first view controller)")
        
        UserInfo.setValue(username, forKeyPath: "name")
        
        do {
            try managedContext.save()
            print("Saved")
        } catch _ as NSError {
            print("Could not save.")
        }
    }
    
    
    
}




/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

//}
