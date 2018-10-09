//
//  AppDelegate.swift
//  Alarm
//
//  Created by Travis Chapman on 10/8/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AlarmController.shared.loadFromPersistentStore()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                print("User gave permission to send notifications")
            }
        }
        
        return true
    }


}

