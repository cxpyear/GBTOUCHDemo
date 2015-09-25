//
//  LoginViewController.swift
//  GBTOUCH
//
//  Created by GBTouchG3 on 15/9/24.
//  Copyright (c) 2015年 GBTouchG3. All rights reserved.
//

import UIKit



class LoginViewController: UIViewController {

    @IBOutlet weak var txtusername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnOffline: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        //设置带图片的textfield
        setTextFieldWithImage("username", txtFiled: self.txtusername)
        setTextFieldWithImage("password", txtFiled: self.txtPassword)
        
        //给登录、离线会议button添加事件
        btnLogin.addTarget(self, action: "LoginClick:", forControlEvents: TouchUpInsideEventControl)
        btnOffline.addTarget(self, action: "OfflineClick:", forControlEvents: TouchUpInsideEventControl)
    }
    
    
    func loginClick(sender: UIButton){
        
    }
    
    
    func OfflineClick(sender: UIButton){
    
    }
    
    func setTextFieldWithImage(imageName: String, txtFiled: UITextField){
        
        //设置图片的高度
        var imgH: CGFloat = 25.0
        //设置textfield的leftview的y  [(等于textfiled的高度 － image高度）＊ 0.5]
        var y = CGFloat((txtFiled.height - imgH) * 0.5)
        var leftView = UIView(frame: CGRectMake(20, y, 40, txtFiled.height - imgH))
        
        //将当前的imageview设置为textfield的左边视图
        var userImgView = UIImageView(image: UIImage(named: imageName))
        userImgView.frame = CGRectMake(10 , 0 , 20 , imgH)
        leftView.addSubview(userImgView)
        
        txtFiled.leftView = leftView
        txtFiled.leftViewMode = UITextFieldViewMode.Always
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
