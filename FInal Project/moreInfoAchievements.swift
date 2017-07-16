//
//  moreInfoAchievements.swift
//  FInal Project
//
//  Created by Student on 2017-05-24.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class moreInfoAchievements: UIViewController {
    
    //descriptions for each level for each achievements
    
    let description_0 = "You haven't achieved this yet! Read some more and you're sure to!"
    
    let descriptions_1 = ["Nice, you read your first book!", "First Day Reading! Start the journey!", "You’ve read for an hour straight!", "Parental guidance improved! Your parent or guardian has signed off a book!", "You took your first photo of a book!"]
    
    let descriptions_2 = [""]
    
    let descriptions_3 = [""]
    
    let descriptions_4 = [""]
    
    let descriptions_5 = [""]
    
    let descriptions_6 = [""]
    
    //info passed on from previous view controller
    var Aimage:String = ""
    var Aname:String = ""
    
    //outlets for labels and image
    @IBOutlet weak var achievementImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var dateAchieved: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("you are viewing the info for the achievement \(Aimage) with name \(Aname)")
        
        // Do any additional setup after loading the view.
        achievementImage.image = UIImage(named: Aimage)
        name.text = Aname
        Description.text = description_0
        dateAchieved.text = "You haven't achieved this yet!"
        
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
