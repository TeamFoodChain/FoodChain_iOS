//
//  JoinViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 3..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController {

    @IBOutlet weak var JoinBtn: UIButton!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var passcomTF: UITextField!
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var emailCheck: UIImageView!
    @IBOutlet weak var passCheck: UIImageView!
    @IBOutlet weak var phoneCheck: UIImageView!
    
    var check = 0
    
    let joinManager = JoinNM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        nameTF.setBottomBorder()
        emailTF.setBottomBorder()
        passcomTF.setBottomBorder()
        passTF.setBottomBorder()
        numberTF.setBottomBorder()
        
        initAddTarget() //emailcheck 추가하면됨
        JoinBtn.isEnabled = false
        JoinBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)

        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: #selector(JoinViewController.back(sender:)))
        
        newBackButton.setBackgroundImage(#imageLiteral(resourceName: "Back"), for: .normal, barMetrics: .default)
        self.navigationItem.leftBarButtonItem = newBackButton
    
      
        
    }
  

    
    func initAddTarget(){
        
       
      
        nameTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        emailTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        passTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        passcomTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        numberTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        confirmBtn.addTarget(self, action: #selector(isValid), for: .touchUpInside)
        
        
        emailTF.addTarget(self, action: #selector(emailCheckcall), for: .editingChanged)
        numberTF.addTarget(self, action: #selector(numberCheckcall), for: .editingChanged)
        
        passTF.addTarget(self, action: #selector(confirmCheck), for: .editingChanged)
        passcomTF.addTarget(self, action: #selector(confirmCheck), for: .editingChanged)
       
       
        
    }
    
    @objc func emailCheckcall(_ sender: UITextField) {
        
        if emailTF.text?.isEmpty == false{
        
        joinManager.emailcheck(email: gsno(emailTF.text)) { [weak self](emailchecking) in
            
            if emailchecking.message == "Success Email Check"{

                self?.emailCheck.image = #imageLiteral(resourceName: "Yes-Color")

            }
            else if emailchecking.message == "This Email Already Exists." || emailchecking.message == "Invalid Data"{

                self?.emailCheck.image = #imageLiteral(resourceName: "Yes")


            }
            else{
                let alertController = UIAlertController(title: "",message: "네트워크 문제입니다.", preferredStyle: UIAlertControllerStyle.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)

            }
        }
        }
    
        
    }
    
    @objc func numberCheckcall(_ sender: UITextField){
        
        if numberTF.text?.isEmpty == false{
            
            joinManager.phonecheck(number: gsno(numberTF.text)) {[weak self] (numberchecking) in
                
                if numberchecking.message == "Success Phone Number Check"{
                    
                    self?.phoneCheck.image = #imageLiteral(resourceName: "Yes-Color")
                    
                }
                else if numberchecking.message == "This Phone Number Already Exists." || numberchecking.message == "Invalid Data"{
                    
                    self?.phoneCheck.image = #imageLiteral(resourceName: "Yes")
                    
                    
                }
                else{
                    let alertController = UIAlertController(title: "",message: "네트워크 문제입니다.", preferredStyle: UIAlertControllerStyle.alert)
                    let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                    alertController.addAction(cancelButton)
                    self?.present(alertController,animated: true,completion: nil)
                    
                }
                
            }
            
        }
        
        
    }
        
    
    
    @objc func confirmCheck() {
        if (passTF.text?.isEmpty)! && (passcomTF.text?.isEmpty)!{
            passCheck.image = UIImage(named: "Yes")
            
        }
        else{
            if passTF.text == passcomTF.text {
                passCheck.image = UIImage(named: "Yes-Color")
                
            }
            else{
                passCheck.image = UIImage(named: "Yes")
                
            }
            
        }
        
    }
    
    @objc func isValid(){
        
        if (nameTF.text?.isEmpty)! || (passTF.text?.isEmpty)! || (emailTF.text?.isEmpty)! || (passcomTF.text?.isEmpty)! || (numberTF.text?.isEmpty)! || passCheck.image == #imageLiteral(resourceName: "Yes") || emailCheck.image == #imageLiteral(resourceName: "Yes") || phoneCheck.image == #imageLiteral(resourceName: "Yes") || check == 0 {
        
            JoinBtn.isEnabled = false
            JoinBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            
        }
        else {
            if passCheck.image == UIImage(named: "Yes-Color") && check == 1{
            
            JoinBtn.isEnabled = true
            JoinBtn.backgroundColor = #colorLiteral(red: 0.2158766389, green: 0.6043385863, blue: 0.4158287644, alpha: 1)
    
            }
        }
    }
    
    @objc func back(sender: UIBarButtonItem) {
        
         navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func confirmtermBtn(_ sender: UIButton) {
        
        if check == 0{
            sender.setImage(#imageLiteral(resourceName: "Yes-Color"), for: .normal)
            check = 1
           
        }
        else if check == 1{
            sender.setImage(#imageLiteral(resourceName: "Yes"), for: .normal)
            check = 0
          
        }
        
    }
    
    @IBAction func JoinAction(_ sender: Any) {
        
        joinManager.nativeCustomerJoin(user_pw: gsno(passcomTF.text), user_name: gsno(nameTF.text), user_email: gsno(emailTF.text), user_phone: gsno(numberTF.text)) { [weak self](Join) in
            
            if Join.message == "Success Signup"{
                
                
                let mainview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabbarview") as! TabBarViewController
                
                let userdata = UserDefaults.standard
                userdata.set(Join.token, forKey: "usertoken")
                userdata.set(Join.cate_flag, forKey: "cate_flag")
                userdata.set(0, forKey: "identify")
                userdata.set(Join.locate_flag,forKey: "selectlocation")
                userdata.synchronize()

               
                self?.present(mainview, animated: true, completion: nil)
           
            }
            else{
                let alertController = UIAlertController(title: "",message: "네트워크 문제입니다.", preferredStyle: UIAlertControllerStyle.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
                
                
            }
            
        }
        
    }
    
    

}
