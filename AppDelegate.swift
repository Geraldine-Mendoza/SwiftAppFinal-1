//
//  AppDelegate.swift
//  NavigationBar(4)
//
//  Created by Student on 2017-03-30.
//  Copyright © 2017 Geraldine Mendoza. All rights reserved.
//

import UIKit
import UserNotifications
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let defaults = UserDefaults.standard
    var photosTaken:Int!
    var booksRead:Int!
    
    /*
     var booksRead:Int = defaults.value(forKey: "PhotosSaved") as! Int? ?? 0
     var photosTaken = defaults.value(forKey: "PhotosSaved") as! Int? ?? 0
     print("this is booksRead: \(booksRead) and this is photosTaken: \(photosTaken)")
     */
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        /*let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
         if launchedBefore  {
         print("First launch, setting UserDefault.")
         let storyboard = UIStoryboard(name: "User Info", bundle: Bundle.main)
         let vc = storyboard.instantiateViewController(withIdentifier: "Username")
         // Send to Username view controller
         } else {
         print("Not First launch")
         UserDefaults.standard.set(true, forKey: "launchedBefore")
         }*/
        
        //NSUserDefaults
        UserDefaults.standard.register(defaults: ["photosTaken" : 0])
        UserDefaults.standard.register(defaults: ["booksRead" : 0])
        
        photosTaken = defaults.integer(forKey: "photosTaken")
        booksRead = defaults.integer(forKey: "booksRead")
        print("this is booksRead: \(booksRead) and this is photosTaken: \(photosTaken)")
        
        
        //changing navigation bar background image
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "navigationBar"), for: .default)
        
        //changing the tint of bar button items (it is white because a transparent overlay makes it dissapear)
        UINavigationBar.appearance().tintColor = UIColor.white
        
        // Override point for customization after application launch.
        
        //changing navigation bar background image
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "navigationBar"), for: .default)
        
        //changing the tint of bar button items (it is white because a transparent overlay makes it dissapear)
        UINavigationBar.appearance().tintColor = UIColor.white
        
        //changing all bar text to myriad font --> could not be done <-- and white
        let navbarFont = UIFont(name: "Myriad Pro It", size: 22) ?? UIFont.systemFont(ofSize: 22)
        
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: navbarFont, NSForegroundColorAttributeName:UIColor.white]
        
        if navbarFont == UIFont.systemFont(ofSize: 22) {
            print("Using system font.")
            
        }
        
        return true
    }
    
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        print("This is photos taken : \(photosTaken)")
        self.saveContext()
        //self.UpdateCounters()
        //self.SaveCounters()
    }
    
    /*
     //update to NSUserDefaults
     func UpdateCounters() {
     
     defaults.set(photosTaken, forKey: "photosTaken")
     print("saved to NSDefaults")
     }
     */
    
    func SaveCounters() {
        
        //defaults.set(photosTaken, forKey: "PhotosSaved")
        //defaults.set(0, forKey: "TaggedBooks")
        //defaults.set(booksRead, forKey: "BooksRead")
    }
    
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "FInal_Project") //name of .xcdatamodel file
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        //self.UpdateCounters()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    
    
    
}
