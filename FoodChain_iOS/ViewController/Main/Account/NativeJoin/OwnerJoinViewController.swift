//
//  OwnerJoinViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 4..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class OwnerJoinViewController: UIViewController {

    @IBOutlet weak var ownerNameTF: UITextField!
    @IBOutlet weak var owneremailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var passcomTF: UITextField!
    @IBOutlet weak var ownernumberTF: UITextField!
    @IBOutlet weak var companynumberTF: UITextField!
    @IBOutlet weak var companyad1TF: UITextField!
    @IBOutlet weak var companyad2TF: UITextField!
    
    var check :Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ownerNameTF.setBottomBorder()
        owneremailTF.setBottomBorder()
        passTF.setBottomBorder()
        passcomTF.setBottomBorder()
        ownernumberTF.setBottomBorder()
        companynumberTF.setBottomBorder()
        companyad1TF.setBottomBorder()
        companyad2TF.setBottomBorder()
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: #selector(OwnerJoinViewController.back(sender:)))
        
        newBackButton.setBackgroundImage(#imageLiteral(resourceName: "Back"), for: .normal, barMetrics: .default)
        self.navigationItem.leftBarButtonItem = newBackButton
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
    @IBAction func joinAction(_ sender: Any) {
        
        let mainview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "favoriteview")
        
        
        navigationController?.pushViewController(mainview, animated: true)
    }
    
    @objc func back(sender: UIBarButtonItem) {
        
        navigationController?.popViewController(animated: true)
    }
        
        
    

   

}
