//
//  StartingScreenController.swift
//  FInal Project
//
//  Created by Student on 2017-04-20.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

//:SCREEN DOES NOT WORK

class StartingScreenController: UIViewController {
    
    // If user data does not exist, begin tutorial
    // If user data does exist, go to confirmation screen
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var newButton: UIButton!
    
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
