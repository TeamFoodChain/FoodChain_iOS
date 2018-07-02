//
//  ViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 1..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    func getAppDelegate() -> AppDelegate!{
        return UIApplication.shared.delegate as! AppDelegate
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let appDelegate = getAppDelegate() {
            appDelegate.loginViewController = self
        }else{
            print("Appdelegate is nil")
        }
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func KakaoLoginAction(_ sender: Any) {
        
        
        let session :KOSession = KOSession.shared()
        
        if session.isOpen() {
            session.close()
        }
        
        session.presentingViewController = self
        session.open(completionHandler: {(error) -> Void in
            
            // 카카오 로그인 화면에서 벋어날 시 호출됨. (취소일 때도 표시됨)
            if error != nil {
                print(error?.localizedDescription ?? "")
            }else if session.isOpen() {
                KOSessionTask.userMeTask(completion: { [weak self](error, kakao) -> Void in
                    if kakao != nil{
                        
                        print(kakao!)
                        let mainview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabbarview") as! TabBarViewController
                        
                        self?.present(mainview, animated: true, completion: nil)
                        
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
    
    @IBAction func LoginAction(_ sender: Any) {

        let mainview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabbarview") as! TabBarViewController
        
        present(mainview, animated: true, completion: nil)




    }
    

}

