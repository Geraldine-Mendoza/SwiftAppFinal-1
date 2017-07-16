//
//  AchievementsController.swift
//  NavigationBar(4)
//
//  Created by Student on 2017-03-31.
//  Copyright © 2017 Geraldine Mendoza. All rights reserved.
//

import UIKit

//class for all cell items in the library view
class AchievementCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
}

class AchievementsController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let achievementGreyImages = ["BookwormUnachieved", "PagesUnachieved", "TagsUnachieved", "SignaturesUnachieved", "BookPhotoUnachieved"]
    let achievementNames = ["Book Worm", "Pages", "Tags", "Signatures", "Book Photo"]

    override func viewDidLoad() {
        super.viewDidLoad()
                
        //burger side bar menu
        if revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector((SWRevealViewController.revealToggle) as (SWRevealViewController) -> (Void) -> Void) // Swift 3 fix
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - UICollectionView Data Source
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "oneAchievement", for: indexPath as IndexPath) as! AchievementCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        //cell.BookCover.image = UIImage(named: arrayBookImages[indexPath.item])
        cell.backgroundColor = UIColor.white // make cell more visible in our example project
        cell.image.image = UIImage(named: achievementGreyImages[indexPath.item])
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        
        //let passThis = indexPath.item
        if let cell = collectionView.cellForItem(at: indexPath) {
            performSegue(withIdentifier: "Matilda", sender: cell)
        } else {
            print("Cannot perform segue to moreDetailAchievements controller")
        }
    }
    
    // change background color when user touches cell
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor(red: 41/255.0, green: 171/255, blue: 230/255, alpha: 1.0)
        //cell?.textLabel.textColor = UIColor.white
    }
    
    // change background color back when user releases touch
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.white
        //cell.myLabel.textColor = UIColor.black
    }
    
    
    //for the specific segue 'toBookInfo', certain information is passed through the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //making sure we are using correct segue
        if segue.identifier == "Matilda" {
            
            //for using indexPath property
            if let indexPath = self.collectionView?.indexPath(for: sender as! UICollectionViewCell) {
                
                //selecting the destination controller
                let detailVC: moreInfoAchievements = segue.destination as! moreInfoAchievements
                
                detailVC.Aimage = achievementGreyImages[indexPath.item]
                detailVC.Aname = achievementNames[indexPath.item]
            }
        } else {
            // Error sender is not a cell or cell is not in collectionView.
        }
    }
}
