//
//  ViewController.swift
//  FInal Project
//
//  Created by Student on 2017-04-17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
// If user data does not exist, begin tutorial
// If user data does exist, go to confirmation screen
    @IBOutlet weak var NewButton: UIButton!
// If user data does not exist, do not display "Continue" option
    @IBOutlet weak var ContinueButton: UIButton!
}

