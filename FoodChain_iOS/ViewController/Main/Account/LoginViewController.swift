//
//  ViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 1..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit
import SwiftyJSON
class LoginViewController: UIViewController {
    
   
    
    let loginManager = LoginNM()
    var mainget = StorehomeMainNM()
    
    
 
    func getAppDelegate() -> AppDelegate!{
        return UIApplication.shared.delegate as! AppDelegate
    }
    @IBOutlet weak var emailphoneTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userdata  = UserDefaults.standard
        
        userdata.removeObject(forKey: "cate_flag")
        userdata.removeObject(forKey: "identify")
        userdata.removeObject(forKey: "selectlocation")
        userdata.synchronize()

        
        
        emailphoneTF.setBottomBorder()
        passTF.setBottomBorder()
   
        if let appDelegate = getAppDelegate() {
            appDelegate.loginViewController = self
        }else{
            print("Appdelegate is nil")
        }
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
  
    }
   

    @IBAction func KakaoLoginAction(_ sender: Any) {
        
       KakaoJoinModule().KakaoLogin(view: self )
        
    }
    
    @IBAction func LoginAction(_ sender: Any) {
        if (emailphoneTF.text?.isEmpty)! || (passTF.text?.isEmpty)!{
            
            let alertController = UIAlertController(title: "",message: "회원정보를 입력해주세요.", preferredStyle: UIAlertControllerStyle.alert)
            let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
            alertController.addAction(cancelButton)
            self.present(alertController,animated: true,completion: nil)
        }
        else{
        loginManager.nativelogin(nativeid: gsno(emailphoneTF.text), password: gsno(passTF.text)) { [weak self](natlogin) in
           
            if natlogin.message == "Success Signin"{
                let mainview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabbarview") as! TabBarViewController
                
                
                
                print(natlogin.cate_flag!)
                print(natlogin.identify!)
                print(natlogin.locate_flag!)
                
                let userdata = UserDefaults.standard
                userdata.set(natlogin.token, forKey: "usertoken")
                userdata.set(natlogin.cate_flag, forKey: "cate_flag")
                userdata.set(natlogin.identify, forKey: "identify")
                userdata.set(natlogin.locate_flag,forKey: "selectlocation")
                userdata.synchronize()
                
                self?.present(mainview, animated: true, completion: nil)
            
                
            }else if natlogin.message == "Incorrect Information"{
               
                let alertController = UIAlertController(title: "",message: "로그인 정보가 올바르지 않습니다.", preferredStyle: UIAlertControllerStyle.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
                
                
                
            }else if natlogin.message == "Wrong Password"{
               
                let alertController = UIAlertController(title: "",message: "비밀번호가 맞지 않습니다.", preferredStyle: UIAlertControllerStyle.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
                
                
            }else{
                
                let alertController = UIAlertController(title: "",message: "네트워크 문제입니다.", preferredStyle: UIAlertControllerStyle.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
                
            }
            
            }
            
            
        }
        
        
        
        
        
        
    }
    
    
}


