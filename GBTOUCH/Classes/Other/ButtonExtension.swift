//
//  ButtonExtension.swift
//  GBTOUCH
//
//  Created by GBTouchG3 on 15/9/24.
//  Copyright (c) 2015年 GBTouchG3. All rights reserved.
//

import UIKit

extension UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    func btnAddTarget(target: AnyObject?, action: Selector){
        self.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
    }

}
