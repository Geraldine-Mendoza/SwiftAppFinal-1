//
//  Tutorial.swift
//  FInal Project
//
//  Created by Student on 2017-06-16.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class GeneralSettings: NSObject {
    
    /**
     Stores a boolean value to set the onboarding was completed
     */
    class func saveOnboardingFinished() {
        UserDefaults.standard.set(true, forKey: "onboarding")
        UserDefaults.standard.synchronize()
    }
    
    /**
     Returns the stored boolean key from NSUserDefaults for checking if the onboarding was completed already or not.
     
     - returns: YES, if the onboarding was already completed before
     */
    class func isOnboardingFinished() -> Bool {
        return UserDefaults.standard.bool(forKey: "onboarding")
    }
    
}

class Tutorial: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        if GeneralSettings.isOnboardingFinished() == false {
            performSegue(withIdentifier: "FIRE!!!", sender: nil)

            print("HALP")
        } else {
            
            performSegue(withIdentifier: "SuffocateWithFloofBalls", sender: nil)
                
            print("NO HALP")
        }


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
