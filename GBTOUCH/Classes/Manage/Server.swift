//
//  Server.swift
//  GBTOUCH
//
//  Created by GBTouchG3 on 15/9/24.
//  Copyright (c) 2015年 GBTouchG3. All rights reserved.
//

import UIKit

class Server: NSObject {
   
    var ipUrl = String()
    var loginServiceUrl = String()
    
    override init(){
        super.init()
        println("server init===============")
        SettingsBundleConfig().registerDefaultsFromSettingsBundle()
        
        getIP()
    }
    
    func getIP(){
        println("server getIP===============")
        var standardDefaults = NSUserDefaults.standardUserDefaults()
        var key = "ip_preference"
        
        var value = standardDefaults.objectForKey(key)
        println("defaults = \(value)")
        if let ip = standardDefaults.stringForKey("ip_preference"){
            self.ipUrl = ip
        }else{
            self.ipUrl = ""
        }
    }
    
    //loginServiceUrl = "http://" + url + ":18080/v1/login"
    
}
