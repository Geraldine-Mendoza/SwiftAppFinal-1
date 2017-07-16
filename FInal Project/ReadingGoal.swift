//
//  ReadingGoal.swift
//  FInal Project
//
//  Created by Rida Rahman on 2017-05-23.
//  Copyright © 2017 Rida Rahman. All rights reserved.
//
// https://medium.com/ios-os-x-development/build-an-stopwatch-with-swift-3-0-c7040818a10f

import UIKit

class ReadingGoal: UIViewController {
    
    @IBOutlet weak var HourGoal: UITextField!
    @IBOutlet weak var MinuteGoal: UITextField!
    @IBOutlet weak var NextButton: UIButton!
    var mingoal = Int()
    var hrgoal = Int()
    var secondstoread:Int = 0
    var initialtime:Int = Int()
    
    // If hours or minutes is changed, user can move to next view
    @IBAction func HourEditingDidChange(_ sender: Any) {
        NextButton.isEnabled = true
    }
    
    @IBAction func MinuteEditingDidChange(_ sender: Any) {
        NextButton.isEnabled = true
    }
    
    func disable() {
        
        NextButton.isEnabled = false
        
    }
    
    
    @IBAction func NextButtonIsPressed(_ sender: Any) {
        print("GERALDINE IS AWESOME!!!!!")
        
        //If value exists
        if HourGoal.text != "" || MinuteGoal.text != "" {
            //If hour exists, set hrgoal to hour and print value exists
            if HourGoal.text != "" {
                self.hrgoal = Int(HourGoal.text!)!
                print("hr Value exists")
                print("\(HourGoal.text!)")
            }
            //Else hours equal 0
            else {
                hrgoal = 0
            }
            //Same as hours, but for minutes
            if MinuteGoal.text != "" {
                self.mingoal = Int(MinuteGoal.text!)!
                print("min value exists")
                print("\(MinuteGoal.text!)")
            }
            else {
                mingoal = 0
            }
            // Changes values to seconds
            print("in ")
            secondstoread = ((mingoal + (hrgoal*60))*60)
            //prints to check value
            print("\(secondstoread)")
            //if time exists, moves to next view controller and sends time to read
            if secondstoread > 0 {
                print("SECONDS > 0")
                performSegue(withIdentifier: "Mr.Friar-DavisIsAGiantBallOfFloof", sender: self)
            }
                //else disables next button
            else {
                NextButton.isEnabled = false
            }
            //function saves text field info to core data
        }
        
        
    }
    
    //for the specific segue 'toBookInfo', certain information is passed through the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //making sure we are using correct segue
        if segue.identifier == "Mr.Friar-DavisIsAGiantBallOfFloof" {
            
            //selecting the destination controller
            let detailVC: TimerController = segue.destination as! TimerController
            
            //sending properties to destination view controller
            detailVC.initialtime = secondstoread
            
            
        }
        else {
            // Error
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Saves initial time
        initialtime = secondstoread
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
