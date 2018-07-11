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
                        
                        print(kakao!)
                        let mainview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "kakaoselectusertype") as! KakaoSelectUsertypeViewController
                        mainview.kakaoUserId = self.gsno(kakao?.id)
                        mainview.KakaoNickname = self.gsno(kakao?.nickname)
                        
                        view.navigationController?.pushViewController(mainview, animated: true)
                        
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

