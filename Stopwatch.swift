//
//  Stopwatch.swift
//  FInal Project
//
//  Created by Rida Rahman on 2017-05-21.
//  Copyright © 2017 Rida Rahman. All rights reserved.
//https://www.ioscreator.com/tutorials/stopwatch-tutorial

import UIKit

class Stopwatch: UIViewController {

    @IBOutlet weak var TimeDisplay: UILabel!
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var StopButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var startTime = TimeInterval()
    var timer = Timer()

    
    @IBAction func StartTimer(_ sender: Any) {
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate
        }

    }
    
    
    
    @IBAction func StopTimer(_ sender: Any) {
        timer.invalidate()
        //timer == nil
       // elapsedTime = 00.0
    }
    
    func updateTime() {
        
        var currentTime = NSDate.timeIntervalSinceReferenceDate
        
        //Find the difference between current time and start time.
        
        var elapsedTime: TimeInterval = currentTime - startTime
        
        let hours = UInt8(elapsedTime/3600.0)
        elapsedTime -= (TimeInterval(hours)*3600)
        //calculate the minutes in elapsed time.
        
        let minutes = UInt8(elapsedTime / 60.0)
        
        elapsedTime -= (TimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        
        let seconds = UInt8(elapsedTime)
        
        elapsedTime -= TimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed.
        
        let fraction = UInt8(elapsedTime * 30)
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        let strHours = String(format: "%02d", hours)
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strFraction = String(format: "%02d", fraction)
        
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
        
        TimeDisplay.text = "\(strHours):\(strMinutes):\(strSeconds)"
        
    }
    
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
