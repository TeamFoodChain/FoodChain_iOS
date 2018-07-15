//
//  KakaoLogin.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 2..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation


class KakaoJoinModule {
    
    func KakaoLogin(view: LoginViewController){
        let session :KOSession = KOSession.shared()
        
        if session.isOpen() {
            session.close()
        }
        
        session.presentingViewController = view.self
        session.open(completionHandler: {(error) -> Void in
            
            // 카카오 로그인 화면에서 벋어날 시 호출됨. (취소일 때도 표시됨)
            if error != nil {
                print(error?.localizedDescription ?? "")
            }else if session.isOpen() {
                KOSessionTask.userMeTask(completion: { (error, kakao) -> Void in
                    if kakao != nil{
                        let kakaologinCheck = LoginNM()
                        kakaologinCheck.kakaoidcheck(kakaoid: self.gsno(kakao?.id)) {(kakaocheck) in
                            _ = UINavigationController.displaySpinner(onView: view.view)
                            if kakaocheck.message == "Success Id Check"{
                                print(kakao!)
                                let mainview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "kakaoselectusertype") as! KakaoSelectUsertypeViewController
                                mainview.kakaoUserId = (kakao?.id)!
                                mainview.KakaoNickname = (kakao?.nickname)!
                                UINavigationController.removeSpinner(spinner: view.view)
                                view.navigationController?.pushViewController(mainview, animated: true)
                                
                            }
                            else if kakaocheck.message == "This Id Already Exists."{
                               
                                let kakaologinManager = LoginNM()
                                kakaologinManager.kakaologin(kakaoid: (kakao?.id)!, completion: {(KakaoLogin) in
                                    if KakaoLogin.message == "Success Signin"{
                                        let mainview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabbarview") as! TabBarViewController
                                        print(KakaoLogin.cate_flag!)
                                        print(KakaoLogin.identify!)
                                        print(KakaoLogin.locate_flag!)
                                        let userdata = UserDefaults.standard
                                        userdata.set(KakaoLogin.token, forKey: "usertoken")
                                        userdata.set(KakaoLogin.cate_flag, forKey: "cate_flag")
                                        userdata.set(KakaoLogin.identify, forKey: "identify")
                                        userdata.set(KakaoLogin.locate_flag,forKey: "selectlocation")
                                        userdata.synchronize()

                                        
                                        UINavigationController.removeSpinner(spinner: view.view)
                                        view.present(mainview, animated: true, completion: nil)
                                        
                                    
                                       
                                    }
                                    else{
                                        print(1)
                                        let alertController = UIAlertController(title: "",message: "네트워크 문제입니다.", preferredStyle: UIAlertControllerStyle.alert)
                                        let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                                        alertController.addAction(cancelButton)
                                        view.present(alertController,animated: true,completion: nil)
                                    }
                                    
                                })
                                
                            }
                            else{
                                print(2)
                                let alertController = UIAlertController(title: "",message: "네트워크 문제입니다.", preferredStyle: UIAlertControllerStyle.alert)
                                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                                alertController.addAction(cancelButton)
                                view.present(alertController,animated: true,completion: nil)
                                
                            }
                            
                        }
                        
                    }
                    else{
                        print(error!)
                    }
                    
                })
                
            } else {
                print("isNotOpen")
            }
        })
        
    }
}

