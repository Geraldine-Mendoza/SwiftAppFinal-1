//
//  MainViewController.swift
//  FInal Project
//
//  Created by Student on 2017-04-24.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

//:SCREEN DOES NOT WORK

class SplashScreen: UIViewController {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var percent: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var finishedLoading: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "finishedLoading", sender: nil)
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
