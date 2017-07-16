//
//  Home.swift
//  FInal Project
//
//  Created by Rida Rahman on 2017-04-27.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import UserNotifications
import CoreData

class Home {

    var notFirstLaunch = Bool()
    var Username = String()
    
    func viewDidLoad() {
    //    viewDidLoad()
    
    /*
    //NameDisplay.text = "Hello, " + name
    let launchedBeforeHome = UserDefaults.standard.bool(forKey: "launchedBefore")
    if launchedBeforeHome  {
    // Request authorization for notifications
   // print("First launch, setting UserDefault.")
    // Save is granted
    UNUserNotificationCenter.current().requestAuthorization(options:
    [[.alert, .sound, .badge]],
				completionHandler: { (granted, error) in
    // Handle Error

    } else {
    //print("Not First launch")
    UserDefaults.standard.set(true, forKey: "launchedBefore")
    }
// Move all to delegate
    // If notifications are authorized
    // Sends notification
    func sendNotification() {
    let content = UNMutableNotificationContent()
    // Header
    content.title = "Time to Read!"
    content.subtitle = messageSubtitle
    // Message
    content.body = "You haven't logged your reading in a while. It's time to pick up a book"
    // Badge number
    content.badge = 1
    }
// Time interval/trigger
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,
    repeats: false)
    // Sending notification request
    let requestIdentifier = "demoNotification"
    let request = UNNotificationRequest(identifier: requestIdentifier,
    content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(request,
    withCompletionHandler: { (error) in
    // Handle error
    
    }
    // Allows notifications from other apps to be delivered with message/sound
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    
    completionHandler([.alert, .sound])

    //@IBOutlet weak var NameDisplay: UILabel!
*/
}
 /*   func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        //getting the managed context where the entity we need is
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //make fetch request
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserInfo")
        
        
        //try to fetch the entity we need, else print error
        do {
                notFirstLaunch = UserInfo.value(forKey: "notFirstLaunch") as! Bool
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        if notFirstLaunch != true {
            performSegue(withIdentifier: "skullMeetsRock", sender: nil)
        }
        else {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            
            //getting the managed context where the entity we need is
            let managedContext = appDelegate.persistentContainer.viewContext
            
            //make fetch request
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserInfo")
            
            
            //try to fetch the entity we need, else print error
            do {
                let users = try managedContext.fetch(fetchRequest)
                if let user = users.first {
                    Username = user.value(forKey: "name") as! String
                }
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
            
        }
        

    }*/
}
