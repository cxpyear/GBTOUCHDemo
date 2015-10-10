//
//  GBUser.swift
//  GBTOUCH
//
//  Created by GBTouchG3 on 15/9/24.
//  Copyright (c) 2015年 GBTouchG3. All rights reserved.
//

import UIKit

class GBUser: NSObject, NSCoding {
    var id = String()
    var username = String()
    var name = String()
    var password = String()
    var type = String()
    var role = String()
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        var id = decoder.decodeObjectForKey("id") as! String
        var uasername = decoder.decodeObjectForKey("username") as! String
        var name = decoder.decodeObjectForKey("name") as! String
        var password = decoder.decodeObjectForKey("password") as! String
        var type = decoder.decodeObjectForKey("type") as! String
        var role = decoder.decodeObjectForKey("role") as! String
        
    }
    
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(self.id, forKey: "id")
        aCoder.encodeObject(self.username, forKey: "username")
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeObject(self.password, forKey: "password")
        aCoder.encodeObject(self.type, forKey: "type")
        aCoder.encodeObject(self.role, forKey: "role")
    }
    
    
    
    
}
