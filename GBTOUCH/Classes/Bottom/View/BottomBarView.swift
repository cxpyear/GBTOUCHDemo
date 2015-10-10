//
//  BottomBarView.swift
//  GBTOUCH
//
//  Created by GBTouchG3 on 15/9/28.
//  Copyright (c) 2015年 GBTouchG3. All rights reserved.
//

import UIKit

var BottomBarCount = 5


class BottomBarView: UIView {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnReconnect: UIButton!
    @IBOutlet weak var btnHelp: UIButton!
    @IBOutlet weak var btnUser: UIButton!
    
    var target = UIViewController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        println("target = \(target.view.frame)")
        
        
        //初始化整个bottombarview的界面大小
        var viewH: CGFloat = 60.0
        var viewW = target.view.width
        var y = CGFloat(target.view.height) - viewH
        self.frame = CGRectMake(0, y, viewW, viewH)
        
        
        println("target = \(target)")
        self.btnBack.btnAddTarget(self, action: "back:")
        
    
        
        
    }
    
    func back(sender: UIButton){
        target.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    func getBottomBarViewInstance(owner: AnyObject!) -> BottomBarView {
        self.target = owner as! UIViewController
        return NSBundle.mainBundle().loadNibNamed("BottomBarView", owner: owner, options: nil).first as! BottomBarView
    }

  
}
