//
//  ViewController.swift
//  FInal Project
//
//  Created by Student on 2017-05-24.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import CoreData

// - CHANGE TEXT FIELDS TO ONLY NUMBERS



//getMOREinfo CONTROLLER
class GetMoreBookInfo: UIViewController {
    
    //number fields
    @IBOutlet weak var hoursField: UITextField!
    @IBOutlet weak var minutesField: UITextField!
    @IBOutlet weak var pagesField: UITextField!
    
    //buttons
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var properties:[String]!
    var numProperties:[Int]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
        
        //scroll for next text box
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        self.navigationItem.setHidesBackButton(true, animated:true);
    }
    
    func keyboardWillShow(notification:NSNotification){
        //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        
        print("The frame of the keyboard: \(keyboardFrame.size.height)")
        contentInset.bottom = keyboardFrame.size.height + 150
        self.scrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInset
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        //making sure that stuff entered is okay
        guard let hours = hoursField.text, let Hours = Int(hours), Hours >= 0 else {
            
            showErrorAlert(message: "Hours Field", description: "Make sure to enter a real number.")
            return
        }
        
        guard let minutes = minutesField.text, let Minutes = Int(minutes), Minutes >= 0 && Minutes <= 59 else {
            
            showErrorAlert(message: "Minutes Field", description: "Make sure to enter an appropiate number.")
            return
        }
        
        //let totalPages:Int = book.value(forKey: "pages")
        
        guard let pagesRead = pagesField.text, let Pages = Int(pagesRead), Pages >= 0 && Pages <= numProperties[0] else {
            
            showErrorAlert(message: "Pages Field", description: "Make sure to enter an appropiate number.")
            return
        }
        
        guard hours.isEmpty == false, minutes.isEmpty == false, pagesRead.isEmpty == false else {
            
            showErrorAlert(message: "Empty Field!", description: "Make sure to enter a number in all of the fields.")
            return
        }
        
        numProperties.append(Hours)
        numProperties.append(Minutes)
        numProperties.append(Pages)
        
        //save(hoursRead: Hours, minutesRead: Minutes, pagesRead: Pages)
        performSegue(withIdentifier: "toCamera", sender: self)
    }
    
    
    //for the specific segue 'moreInfo', certain information is passed through the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //making sure we are using correct segue
        if segue.identifier == "toCamera" {
            
            //self.collectionView?.indexPath(for: sender as! [String])
            
            //selecting the destination controller
            let detailVC: CoverPicture = segue.destination as! CoverPicture
            
            print("the properties we are sending: \(properties) and \(numProperties)")
            
            //sending properties to destination view controller
            detailVC.properties = properties
            detailVC.numProperties = numProperties
            detailVC.backControllers = 4
        }
    }
    
}
