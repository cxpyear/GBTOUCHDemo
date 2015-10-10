//
//  RegisterViewController.swift
//  GBTOUCH
//
//  Created by GBTouchG3 on 15/9/25.
//  Copyright (c) 2015年 GBTouchG3. All rights reserved.
//

import UIKit

class AgendaViewController: UIViewController {

    var bottomBarView = BottomBarView()
    
    @IBOutlet weak var btnClick: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnClick.btnAddTarget(self, action: "changeColor:")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func changeColor(sender: UIButton){
        //1.跳转到bottombarview中的getBottomBarViewInstance方法中
        //2.跳转到awakefromnib方法，初始化该bottombarview
        //3.回到这里，addsubview
        
        bottomBarView = BottomBarView().getBottomBarViewInstance(self)
        self.view.addSubview(bottomBarView)
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
