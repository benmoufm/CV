//
//  AppDelegate.swift
//  CV
//
//  Created by Mélodie Benmouffek on 16/07/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let home = UINavigationController()
        home.tabBarItem = UITabBarItem(title: "Home", image: nil, selectedImage: nil)
        
        let hobbies = UINavigationController()
        hobbies.tabBarItem = UITabBarItem(title: "Hobbies", image: nil, selectedImage: nil)
        
        let studies = UINavigationController()
        studies.tabBarItem = UITabBarItem(title: "Studies", image: nil, selectedImage: nil)
        
        let competences = UINavigationController()
        competences.tabBarItem = UITabBarItem(title: "Competences", image: nil, selectedImage: nil)
        
        let contact = UINavigationController()
        contact.tabBarItem = UITabBarItem(title: "Contact", image: nil, selectedImage: nil)
        
        let tabs = UITabBarController()
        tabs.viewControllers = [home, hobbies, studies, competences, contact]
        
        self.window!.rootViewController = tabs
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

