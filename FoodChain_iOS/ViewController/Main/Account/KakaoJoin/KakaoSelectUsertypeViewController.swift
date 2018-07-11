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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print(kakaoUserId)
        print(KakaoNickname)
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
