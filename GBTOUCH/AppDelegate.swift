//
//  AppDelegate.swift
//  GBTOUCH
//
//  Created by GBTouchG3 on 15/9/24.
//  Copyright (c) 2015年 GBTouchG3. All rights reserved.
//

import UIKit

var gbUser = GBUser()


//ip在setting.bundle中的键
var ipKey = "ip_preference"


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UIAlertViewDelegate {

    var window: UIWindow?
    var server = Server()
    var ip = String()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        var ipValue = server.ipUrl
        ip = ipValue
        println("ipvalue = \(ipValue)")
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "defaultsSettingsChanged:", name: UIApplicationWillEnterForegroundNotification, object: nil)
//        NSNotificationCenter.defaultCenter().postNotificationName(NSUserDefaultsIPDidChangedNotificationName, object: nil, userInfo: [NSUserDefaultsIPValueName: self.ip])
//        var ip = String()
//        if let ipValue = NSUserDefaults.standardUserDefaults().objectForKey(ipKey) as? String {
//            ip = ipValue
//        }else{
//            ip = ""
//        }
//        NSNotificationCenter.defaultCenter().postNotificationName(NSUserDefaultsIPDidChangedNotificationName, object: nil, userInfo: [NSUserDefaultsIPValueName: ip])
        
        return true
    }
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        println("applicationDidEnterBackground ")
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIApplicationWillEnterForegroundNotification, object: nil)
    }
    
    func defaultsSettingsChanged(notification: NSNotification){
        let standards = NSUserDefaults.standardUserDefaults()
        
        if let ipValue = standards.objectForKey(ipKey) as? String{
            self.ip = ipValue
        }else{
            self.ip = ""
        }
        println("ip changed = \(self.ip)")
        
        NSNotificationCenter.defaultCenter().postNotificationName(NSUserDefaultsIPDidChangedNotificationName, object: nil, userInfo: [NSUserDefaultsIPValueName: self.ip])
    }


}

