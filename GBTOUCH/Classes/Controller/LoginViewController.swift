//
//  LoginViewController.swift
//  GBTOUCH
//
//  Created by GBTouchG3 on 15/9/24.
//  Copyright (c) 2015年 GBTouchG3. All rights reserved.
//

import UIKit
import Alamofire


var appDelegate = AppDelegate()


class LoginViewController: UIViewController {

    @IBOutlet weak var bg_btn: UIButton!
    @IBOutlet weak var txtusername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnOffline: UIButton!
    
    //设置页面ip
    var ip = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        println("filepath = \(NSHomeDirectory())")
        
        //程序初始化的时候判断url是否为空，如果空，提示设置ip，否则不提示
        if appDelegate.server.ipUrl == ""{
            UIAlertView(title: "提示", message: "请先设置IP再使用本系统", delegate: self, cancelButtonTitle: "设置").show()
        }
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "checkIfIPValueValuable:", name: NSUserDefaultsIPDidChangedNotificationName, object: nil)
        
        
        //设置带图片的textfield
        setTextFieldWithImage("username", txtFiled: self.txtusername)
        setTextFieldWithImage("password", txtFiled: self.txtPassword)
        
        //给登录、离线会议button添加事件
        btnLogin.btnAddTarget(self, action: "loginClick:")
        btnOffline.btnAddTarget(self, action: "offlineClick:")
        
    }

    
    func checkIfIPValueValuable(notification: NSNotification){
        if let userInfo = notification.userInfo{
            self.ip = userInfo[NSUserDefaultsIPValueName] as! String
            if self.ip.isEmpty{
                UIAlertView(title: "提示", message: "请先设置IP再使用本系统", delegate: self, cancelButtonTitle: "设置").show()
            }
        }
    }
    
    
    func loginClick(sender: UIButton){
        var name = txtusername.text
        var password = txtPassword.text
        
        var paras = ["username":name, "password": password]
        
        Alamofire.request(.POST, appDelegate.server.loginServiceUrl ,parameters: paras, encoding: .JSON).responseJSON(options: NSJSONReadingOptions.MutableContainers) { (request,response, data, error) ->
            Void in
            
            println("gbuser data = \(data)")

            var loadingView = MRProgressOverlayView.showOverlayAddedTo(self.view, title: "正在登录，请稍候...", mode: MRProgressOverlayViewMode.Indeterminate, animated: true)
            
            if error != nil{
                println("login err = \(error)")
                loadingView.dismiss(true)
                UIAlertView(title: "提示", message: "登录失败，无法连接到服务器", delegate: self, cancelButtonTitle: "确定").show()
                return
            } else if(response?.statusCode != 200){
                loadingView.dismiss(true)
                UIAlertView(title: "提示", message: "登录失败，用户名或密码错误", delegate: self, cancelButtonTitle: "确定").show()
                self.txtusername.text = ""
                self.txtPassword.text = ""
                self.txtusername.becomeFirstResponder()
                return
            }else{
                loadingView.dismiss(true)
                //把json数据转换成GBUser类
            
                var loginUser: GBUser = GBUser(keyValues: data!)
           
                NSUserDefaults.standardUserDefaults().setObject(data, forKey: "GBUser")

               
                //把当前用户赋值为全局变量gbUser
                gbUser = loginUser

//                self.getUserName()
                
                //登录成功则跳转到议程界面
                self.SwitchViewControllerWithStoryboard("agendaVC", sourceVC: self)
            }
        }

    }
    
    
    func offlineClick(sender: UIButton){
        
    }
    
    func getUserName(){
        var standards = NSUserDefaults.standardUserDefaults()
        var username = standards.objectForKey("GBUser")?.objectForKey("username")
        println("username = \(username)")
    }
    
    
    func SwitchViewControllerWithStoryboard(destVCIdentififyName: String, sourceVC: UIViewController){
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destVC = storyboard.instantiateViewControllerWithIdentifier(destVCIdentififyName) as! UIViewController
        sourceVC.presentViewController(destVC, animated: true, completion: nil)
    }
//    func SaveModel(data: NSData, saveKey: String){
//        
//        
//        //把user信息存储在NSUserDefaults中以GBUser为键的nsdictionary中,当登录用户信息更新的时候，该字典中键值也会自动更新
//        let userData = NSKeyedArchiver.archivedDataWithRootObject(data)
//        NSUserDefaults.standardUserDefaults().setObject(data, forKey: "GBUser")
//    }
    
    
    
    
    
    /**
    给出一个图片，设置文本框带图片格式
    
    :param: imageName <#imageName description#>
    :param: txtFiled  <#txtFiled description#>
    */
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
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: NSUserDefaultsIPDidChangedNotificationName, object: nil)
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
