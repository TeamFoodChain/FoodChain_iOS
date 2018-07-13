//
//  KakaoSelectUsertypeViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 4..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class KakaoSelectUsertypeViewController: UIViewController {
    
    var kakaoUserId :String = ""
    var KakaoNickname:String = ""
    
    let kakaologin = LoginNM()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print(kakaoUserId)
        print(KakaoNickname)
        
//        kakaologin.kakaoidcheck(kakaoid: kakaoUserId) { [weak self](kakaocheck) in
//            
//            if kakaocheck.message == "Success Id Check"{
//                
//        
//            }
//            else if kakaocheck.message == "This Id Already Exists."{
//                
//                self?.kakaologin.kakaologin(kakaoid: (self?.kakaoUserId)!, completion: { [weak self](KakaoLogin) in
//                    
//                    if KakaoLogin.message == "Success Signin"{
//                        let mainview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabbarview") as! TabBarViewController
//                      
//                        
//                        print(KakaoLogin.cate_flag)
//                        print(KakaoLogin.identify)
//                        print(KakaoLogin.locate_flag)
//                        
//                        let userdata = UserDefaults.standard
//                        userdata.set(KakaoLogin.token, forKey: "usertoken")
//                        userdata.set(KakaoLogin.cate_flag, forKey: "cate_flag")
//                        userdata.set(KakaoLogin.identify, forKey: "identify")
//                        userdata.set(KakaoLogin.locate_flag,forKey: "selectlocation")
//                        userdata.synchronize()
//                        
//                        self?.present(mainview, animated: true, completion: nil)
//                        
//                    }
//                    else{
//                        print(1)
//                        let alertController = UIAlertController(title: "",message: "네트워크 문제입니다.", preferredStyle: UIAlertControllerStyle.alert)
//                        let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
//                        alertController.addAction(cancelButton)
//                        self?.present(alertController,animated: true,completion: nil)
//                        
//                    }
//                    
//                })
//                
//                
//            }
//            else{
//                print(2)
//                let alertController = UIAlertController(title: "",message: "네트워크 문제입니다.", preferredStyle: UIAlertControllerStyle.alert)
//                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
//                alertController.addAction(cancelButton)
//                self?.present(alertController,animated: true,completion: nil)
//                
//                
//            }
//            
//        }
        
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: #selector(KakaoJoinViewController.back(sender:)))
        
        newBackButton.setBackgroundImage(#imageLiteral(resourceName: "Back"), for: .normal, barMetrics: .default)
        self.navigationItem.leftBarButtonItem = newBackButton
        
    }
    @IBAction func kakaojoin1(_ sender: Any) {
        let kakaoCustomerJoinview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "kakaocustomerjoinView") as! KakaoJoinViewController
        kakaoCustomerJoinview.KakaoNickname = KakaoNickname
        kakaoCustomerJoinview.kakaoUserId = kakaoUserId
        navigationController?.pushViewController(kakaoCustomerJoinview, animated: true)
        
      
        
    }
   
    @IBAction func kakaojoin2(_ sender: Any) {
        let kakaoCompanyJoinview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "kakaocompanyjoinView") as! KakaoOwnerJoinViewController
        kakaoCompanyJoinview.KakaoNickname = KakaoNickname
        kakaoCompanyJoinview.kakaoUserId = kakaoUserId
        navigationController?.pushViewController(kakaoCompanyJoinview, animated: true)
    }
    
    @objc func back(sender: UIBarButtonItem) {
        
        navigationController?.popViewController(animated: true)
    }
 


}
