//
//  BottomBarViewController.swift
//  GBTOUCH
//
//  Created by GBTouchG3 on 15/9/28.
//  Copyright (c) 2015年 GBTouchG3. All rights reserved.
//

import UIKit

class BottomBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.view.frame = CGRectMake(0, 604 , 768 , 100)
        self.view.backgroundColor = UIColor.purpleColor()
        
        println("self.view = \(self.view.subviews)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
