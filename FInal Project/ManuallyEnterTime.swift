//
//  ManuallyEnterTime.swift
//  FInal Project
//
//  Created by Student on 2017-06-07.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class ManuallyEnterTime: UIViewController {

    @IBOutlet weak var hourTextfield: UITextField!
    @IBOutlet weak var minuteTextfield: UITextField!
    @IBOutlet weak var lastPageTextfield: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    var hoursRead = Int()
    var minutesRead = Int()
    var lastPageRead = Int()
    var timeEntered = false
    var pagesEntered = false
    
    @IBAction func hoursReadIsChanged(_ sender: Any) {
        timeEntered = true
        if (timeEntered == true && pagesEntered == true) {
            nextButton.isEnabled = true
        }
    }
    
    @IBAction func minutesReadIsChanged(_ sender: Any) {
        timeEntered = true
        if (timeEntered == true && pagesEntered == true) {
            nextButton.isEnabled = true
        }
    }
    
    @IBAction func pagesReadIsChanged(_ sender: Any) {
        pagesEntered = true
        if (timeEntered == true && pagesEntered == true) {
            nextButton.isEnabled = true
        }
    }

    func checkForAchievement() {
        if let lastPageRead = lastPageTextfield.text, lastPageRead != "", let lastPageInt = Int(lastPageRead) {
            
            reachedAchievementAlert(title: "Book Worm Achieved", message: "You finished reading a book!", image: "", currentView: self)
            
        }
    }
    
    /*
    @IBAction func nextButtonIsPressed(_ sender: Any) {
        if hourTextfield.text == "" && hourTextfield.text == nil {
            hoursRead = hourTextfield.text
        }
        if minuteTextfield.text != "" && minuteTextfield.text != nil {
            minutesRead = minuteTextfield.text
        }
        if lastPageTextfield.text != "" && lastPageTextfield.text != nil {
            pagesRead = lastPageTextfield.text
        }
        
    }
 */
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
