//
//  KakaoOwnerJoinViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 4..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class KakaoOwnerJoinViewController: UIViewController {

    var check: Int = 0
    
    @IBOutlet weak var ownernameTF: UITextField!
    @IBOutlet weak var owneremailTF: UITextField!
    @IBOutlet weak var ownernumberTF: UITextField!
    @IBOutlet weak var companynumTF: UITextField!
    @IBOutlet weak var companyadress1TF: UITextField!
    @IBOutlet weak var companyadress2TF: UITextField!
    @IBOutlet weak var emainCheck: UIImageView!
    @IBOutlet weak var comnumCheck: UIImageView!
    @IBOutlet weak var termCheck: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ownernameTF.setBottomBorder()
        owneremailTF.setBottomBorder()
        ownernumberTF.setBottomBorder()
        companynumTF.setBottomBorder()
        companyadress1TF.setBottomBorder()
        companyadress2TF.setBottomBorder()

        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: #selector(KakaoOwnerJoinViewController.back(sender:)))
        
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
    @IBAction func KownerJoinAction(_ sender: Any) {
        
        let mainview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "favoriteview")
        
        
        navigationController?.pushViewController(mainview, animated: true)
    }
    

}
