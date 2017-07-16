 //
//  HomeViewController.swift
//  NavigationBar(4)
//
//  Created by Student on 2017-03-31.
//  Copyright © 2017 Geraldine Mendoza. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // LABEL SHOULD BE CHANGED TO NAME FROM USER_INFO
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
                
        //burger side bar menu
        if revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector((SWRevealViewController.revealToggle) as (SWRevealViewController) -> (Void) -> Void) // Swift 3 fix
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }

    //@IBOutlet weak var NameDisplay: UILabel!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
