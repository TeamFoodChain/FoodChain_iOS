//
//  KakaoJoinViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 3..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class KakaoJoinViewController: UIViewController {
    
    var kakaoUserId :String = ""
    var KakaoNickname:String = ""
    var check : Int = 0

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var emailCheck: UIImageView!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var JoinBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        emailTF.setBottomBorder()
        numberTF.setBottomBorder()
        
        print(kakaoUserId)
        print(KakaoNickname)
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: #selector(KakaoJoinViewController.back(sender:)))
        
        newBackButton.setBackgroundImage(#imageLiteral(resourceName: "Back"), for: .normal, barMetrics: .default)
        self.navigationItem.leftBarButtonItem = newBackButton
        
        initAddTarget() //emailcheck 추가하면됨
        JoinBtn.isEnabled = false
        JoinBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)

       
       
        
    }
    func initAddTarget(){
        
        emailTF.addTarget(self, action: #selector(duplicateCheck), for: .editingChanged)
        emailTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        
        numberTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        confirmBtn.addTarget(self, action: #selector(isValid), for: .touchUpInside)
        
        
        
        
    }
    
    @objc func duplicateCheck(_ sender: UITextField) {
        
        
    }
  
    
    @objc func isValid(){
        
        if (emailTF.text?.isEmpty)! || (numberTF.text?.isEmpty)! || check == 0 {
            
            JoinBtn.isEnabled = false
            JoinBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            
        }
        else {
            if check == 1{
                
                JoinBtn.isEnabled = true
                JoinBtn.backgroundColor = #colorLiteral(red: 0.2158766389, green: 0.6043385863, blue: 0.4158287644, alpha: 1)
                
            }
        }
    }
    
    @objc func back(sender: UIBarButtonItem) {
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func confirmTermAction(_ sender: UIButton) {
        
        if check == 0{
            sender.setImage(#imageLiteral(resourceName: "Yes-Color"), for: .normal)
            check = 1
            
        }
        else if check == 1{
            sender.setImage(#imageLiteral(resourceName: "Yes"), for: .normal)
            check = 0
            
        }
        
        
        
    }
    
    @IBAction func kakaoJoinAction(_ sender: Any) {
        
        let kakaojoin = JoinNM()
        kakaojoin.nativeKakaoCustomerJoin(user_pw_check: kakaoUserId, user_pw: kakaoUserId, user_name: KakaoNickname, user_email: gsno(emailTF.text), user_phone: gsno(numberTF.text), user_id: kakaoUserId) { [weak self](kakaojoin) in
           
            
            if kakaojoin.message == "success signup"{
                let mainview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabbarview") as! TabBarViewController
                
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
