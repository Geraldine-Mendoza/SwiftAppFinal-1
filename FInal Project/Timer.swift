//
//  Timer.swift
//  FInal Project
//
//  Created by Rida Rahman on 2017-05-22.
//  Copyright © 2017 Student. All rights reserved.
// https://medium.com/ios-os-x-development/build-an-stopwatch-with-swift-3-0-c7040818a10f

import UIKit

class TimerController: UIViewController {


    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var TimeDisplay: UILabel!
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var PauseButton: UIButton!
    @IBOutlet weak var ResetButton: UIButton!
    
    var seconds = Int() //This variable will hold a starting value of seconds. It could be any amount above 0.
    var initialtime = Int()
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    var resumeTapped = false
    var timeRead = 0
    
    // If start button is tapped
    @IBAction func StartButtonisTapped(_ sender: Any) {
        //Set initial time to number of seconds user wants to read
        seconds = initialtime
        // If timer is not running, start timer and disable start button (so timer cannot be started again without stopping)
        if isTimerRunning == false {
            runTimer()
            self.StartButton.isEnabled = false
        }
    }
    //If pause button is tapped

    @IBAction func PauseButtonisTapped(_ sender: Any) {
        //If time read by user is less than the initial time minus seconds left (time read since hitting start button)
        if (initialtime - seconds) > timeRead {
            //Time read is equal to initial time to read minus seconds left
        timeRead = (initialtime - seconds)
        }
        print("Time read = \(timeRead)")
        //stop timer
        if self.resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
            //set name of button to resume
self.PauseButton.setTitle("Resume",for: .normal)
            //allow user to move to next view controller
            nextButton.isEnabled = true
        } else {
            // if button is set to resume, timer starts
            runTimer()
            self.resumeTapped = false
            //User cannot move to next screen until timer is paused again
            nextButton.isEnabled = false
            //Button is set to pause
self.PauseButton.setTitle("Pause",for: .normal)
        }
        //self.PauseButton.setTitle("Resume",for: .normal)
    }
    //If reset button is tapped
    @IBAction func ResetButtonisTapped(_ sender: Any) {
        //Timer is stopped
        timer.invalidate()
        seconds = initialtime    //Seconds to read is reset
        TimeDisplay.text = timeString(time: TimeInterval(seconds))
        //Buttons and variables are reset
        isTimerRunning = false
        PauseButton.isEnabled = false
        self.StartButton.isEnabled = true
        nextButton.isEnabled = false
    }
    //If next button is tapped, moves to next screen and sends seconds read
    @IBAction func nextButtonIsTapped(_ sender: Any) {
        performSegue(withIdentifier: "99WaysToCommitMurder", sender: self)
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(TimerController.updateTimer)), userInfo: nil, repeats: true)
        //Pause button is enabled
        isTimerRunning = true
        PauseButton.isEnabled = true
    }
    
    func updateTimer() {
        //If less than one second is left, stops timer
        if seconds < 1 {
            timer.invalidate()
        }
        else {
        seconds -= 1     //This will decrement(count down)the seconds.
            print("\(seconds)")
        TimeDisplay.text = timeString(time: TimeInterval(seconds)) //This will update the label.
        }
    }
    //Seconds is converted to hours, minutes, and seconds to display
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
//ADD THINGS FOR PASSING TIMEREAD THROUGH SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //making sure we are using correct segue
        if segue.identifier == "99WaysToCommitMurder" {
            
            //selecting the destination controller
            let detailVC: TimerProgressViewController = segue.destination as! TimerProgressViewController
            
            //sending properties to destination view controller
            detailVC.timeRead = timeRead
            
            
        }
        else {
            // Error sender is not a cell or cell is not in collectionView.
        }
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Starts with pause disabled
        PauseButton.isEnabled = false
        //seconds = initialtime
         print("\(seconds)")

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
