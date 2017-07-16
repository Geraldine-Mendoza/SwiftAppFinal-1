//
//  AchievementAlertController.swift
//  FInal Project
//
//  Created by Student on 2017-06-06.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class AchievementAlertController: UIViewController {

    //achievement info controller
    var achievementTitle = String()
    var achievementDescription = String()
    var image = String()
    
    //labels, views, buttons and image names
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var yayDismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = achievementTitle
        descriptionLabel.text = achievementDescription
        
        self.myView.layer.borderWidth = 4
        // - change color to the one media people gave
        self.myView.layer.borderColor = UIColor.blue.cgColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func yayDismissClicked(_ sender: Any) {
        
        
        
        self.dismiss(animated: true, completion: nil)
    }

}

//this extension contains the function to call an alert concerning a reached achievement
extension UIViewController {
    
    func reachedAchievementAlert(title: String, message: String, image: String, currentView: UIViewController) {
        
        let storyboard = UIStoryboard(name: "AchievementAlert", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: "alert") as! AchievementAlertController
        myAlert.achievementTitle = title
        myAlert.achievementDescription = message
        myAlert.image = image
        //myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        //myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        currentView.present(myAlert, animated: true, completion: nil)
    }
    
}

