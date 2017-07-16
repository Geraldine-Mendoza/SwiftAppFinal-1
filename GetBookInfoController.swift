//
//  GetBookInfoController.swift
//  FInal Project
//
//  Created by Student on 2017-04-28.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import CoreData

//: THE SECOND VIEW CONTROLLER SHOULD SEND THE INFO TO THE THIRD VIEW CONTROLLER (CAMERA) AND THEN TO THE LIBRARY


//FIRST VIEW CONTROLLER
class GetBookInfoController: UIViewController, UITextFieldDelegate {
    
    //buttons
    @IBOutlet weak var continueButton: UIButton!
    
    //textFields
    @IBOutlet weak var bookTitle: UITextField!
    @IBOutlet weak var pages: UITextField!
    @IBOutlet weak var author: UITextField!
    
    //scrollview
    @IBOutlet weak var theScrollView: UIScrollView!
    
    //variables which send info
    var properties:[String]!
    var numProperties:[Int]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //hide keyboard when outside tapped
        
        bookTitle.tag = 0
        pages.tag = 1
        author.tag = 2
        
        self.hideKeyboardWhenTappedAround()
        
        //scroll for next text box
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    func keyboardWillShow(notification:NSNotification){
        //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.theScrollView.contentInset
        
        print("The frame of the keyboard: \(keyboardFrame.size.height)")
        contentInset.bottom = keyboardFrame.size.height + 150
        self.theScrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.theScrollView.contentInset = contentInset
    }
    
    //next button is clicked
    @IBAction func addBook(_ sender: UIButton) {
        
        //all these if statements make sure that the fields have correct info: if they dont, an error alert is sent
        guard let name = bookTitle.text, name.isEmpty == false else {
            showErrorAlert(message: "Add a book title!", description: "The field is empty.")
            return
        }
        
        guard let Numpages = pages.text, Numpages.isEmpty == false, let IntPages:Int = Int(Numpages), IntPages > 0 else {
            showErrorAlert(message: "The Number of Pages", description: "Is not possible")
            return
        }
        
        guard let Author = author.text, Author.isEmpty == false else {
            showErrorAlert(message: "Author field", description: "So the book wrote itself?")
            return
        }
        
        properties = [name, Author]
        numProperties = [IntPages]
        
        performSegue(withIdentifier: "moreInfo", sender: self)
    }
    
    
    //exit back from getNewBookInfoController
    @IBAction func unwindtoInitial(segue: UIStoryboardSegue) {
        print("Unwinding segue.")
    }
    
    /*
    //function saves text field info to core data
    func save(name: String, pages: Int, author: String) {
        
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
        book = NSManagedObject(entity: entity,
                                   insertInto: managedContext)
        
        print("about to save new info for book (first view controller)")
        
        book.setValue(name, forKeyPath: "name")
        book.setValue(pages, forKeyPath: "pages")
        book.setValue(author, forKeyPath: "author")
        book.setValue(false, forKey: "tag")
        book.setValue(false, forKey: "coolTag")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }*/
    
    //for the specific segue 'moreInfo', certain information is passed through the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //making sure we are using correct segue
        if segue.identifier == "moreInfo" {
            
            //self.collectionView?.indexPath(for: sender as! [String])
            
            //selecting the destination controller
            let detailVC: GetMoreBookInfo = segue.destination as! GetMoreBookInfo
            
            print("the properties we are sending: \(properties) and \(numProperties)")
            
            detailVC.properties = properties
            detailVC.numProperties = numProperties
        }
    }
    
}

//for hiding keyboard after click
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //error alert with okay option
    func showErrorAlert(message: String, description: String) {
        
        let alertController = UIAlertController(title: message, message:
            description, preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
}
