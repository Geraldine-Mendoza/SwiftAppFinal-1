//
//  TimerProgressViewController.swift
//  
//
//  Created by Student on 2017-05-30.
//
//

import UIKit

class TimerProgressViewController: UIViewController {
    @IBOutlet weak var hourProgressLabel: UILabel!
    @IBOutlet weak var minuteProgressLabel: UILabel!
    var timeRead = Int()
    var hourProgress = Int(0)
    var minuteProgress = Int(0)
    @IBOutlet weak var finalNextButton: UIButton!
    @IBOutlet weak var pageProgress: UITextField!
    var pageProgressValue = Int(0)
// If number of pages read is changed, next button is enabled and user is allowed to move to next screen
    @IBAction func pageProgressEditingDidChange(_ sender: Any) {
        finalNextButton.isEnabled = true
    }
    //Once button is pressed, checks for empty textfield/0
    @IBAction func finalNextButtonIsPressed(_ sender: Any) {
        if pageProgress.text == "" {
            finalNextButton.isEnabled = false
            print("Textfield is empty")
        }
        else {
            pageProgressValue = Int(pageProgress.text!)!
            print("Textfield is not empty")
        }
        if pageProgressValue <= 0
        {
            finalNextButton.isEnabled = false
            print("Textfield was equal to 0")
        }
    }
//Displays amount of time user read in hours and minutes
    override func viewDidLoad() {
        super.viewDidLoad()
print("\(timeRead)")
hourProgress = (timeRead/3600)
print("\(hourProgress)")
minuteProgress = ((timeRead - (hourProgress*3600))/60)
print("\(minuteProgress)")
hourProgressLabel.text = String(hourProgress)
minuteProgressLabel.text = String(minuteProgress)

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
