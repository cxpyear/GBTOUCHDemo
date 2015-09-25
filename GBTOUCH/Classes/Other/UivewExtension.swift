//
//  UivewExtension.swift
//  GBTOUCH
//
//  Created by GBTouchG3 on 15/9/24.
//  Copyright (c) 2015年 GBTouchG3. All rights reserved.
//

import UIKit

extension UIView{

    var width: CGFloat{
        return self.frame.size.width
    }
    
    var height: CGFloat{
        return self.frame.size.height
    }
    
    var x: CGFloat{
        return self.frame.origin.x
    }
    
    var y: CGFloat{
        return self.frame.origin.y
    }
    
    
    func setWidth(width: CGFloat){
        self.frame.size.width = width
    }
    
    func setHeight(height: CGFloat){
        self.frame.size.height = height
    }
    
    func setX(x: CGFloat){
        self.frame.origin.x = x
    }
    
    func setY(y: CGFloat){
        self.frame.origin.y = y
    }

}
