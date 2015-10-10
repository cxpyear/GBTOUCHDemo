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
        //获取ip
        ipUrl = getIP()
        
        //用户登录
        loginServiceUrl = "http://" + ipUrl + ":18080/v1/login"
    }
    
    
    func getIP() -> String{
        println("server getIP===============")
        
        var result = String()
        var standardDefaults = NSUserDefaults.standardUserDefaults()

        if let ip = standardDefaults.stringForKey(ipKey){
            result = ip
        }else{
            result = ""
        }
        
        println("get ip ========= \(result)")
        return result
    }
    
    
}
