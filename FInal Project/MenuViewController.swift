//
//  ViewController.swift
//  NavigationBar(4)
//
//  Created by Student on 2017-03-30.
//  Copyright © 2017 Geraldine Mendoza. All rights reserved.
//

import UIKit

//: CONSTRAINTS AND ~EXACT~ SIZES NEED TO BE ADDED

class MenuViewController: UITableViewController {
    
    var menuItems:[String] = ["HOME", "LIBRARY", "ACHIEVEMENTS", "CALENDAR", "CREDITS"]
    var menuIcons:[String] = ["HOME", "LIBRARY", "ACHIEVEMENTS", "CALENDAR"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.backgroundColor = UIColor(red: 41/255.0, green: 171/255, blue: 230/255, alpha: 1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    //number of cells (rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    //size of cells
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 0 {
            return 218.0 //Choose custom row height
        } else {
            
            return 85 //standard row height
        }
    }
    
    //customizing cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("Editing menu row \(indexPath.row)")
        
        let row = indexPath.row
        
        //normal menu cells
        if row > 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "0, \(row)", for: indexPath) as! normalMenuCell
            
            //setting text and images
            cell.label?.text = menuItems[row-1]
            
            //setting images for those that are not the last cell
            if row < 5 {
                
                cell.icon?.image = UIImage(named: menuIcons[row-1])
            }
            
            return cell
        }
        
        //profile cell
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "0, \(row)", for: indexPath) as! menuProfileCell
            
            cell.profileName?.text = "MYNAME"
            cell.profileImage?.image = UIImage(named: "AvatarHolder")
            
            return cell
        }
        
    }

    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    
     // Override to support editing the table view.
    /*
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    
     // Override to support rearranging the table view.
    /*
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
