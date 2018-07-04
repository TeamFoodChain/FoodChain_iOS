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
    @IBOutlet weak var termCheck: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTF.setBottomBorder()
        numberTF.setBottomBorder()
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: #selector(KakaoJoinViewController.back(sender:)))
        
        newBackButton.setBackgroundImage(#imageLiteral(resourceName: "Back"), for: .normal, barMetrics: .default)
        self.navigationItem.leftBarButtonItem = newBackButton
       
       
        
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
        
        let mainview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "favoriteview")
        
       
        navigationController?.pushViewController(mainview, animated: true)
        
    }
    
    

}
