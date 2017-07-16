//
//  HomeTutorial.swift
//  FInal Project
//
//  Created by Student on 2017-06-21.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class HomeTutorial: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("got to viewdid load")
        
        GeneralSettings.saveOnboardingFinished()
        if GeneralSettings.isOnboardingFinished() == true {
            print("Its true ahhhhhrkehodufh")
        }
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
