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
    
    var check = 0
    
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
        
        
        emailTF.addTarget(self, action: #selector(duplicateCheck), for: .editingChanged)
        emailTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        
        passTF.addTarget(self, action: #selector(confirmCheck), for: .editingChanged)
        passTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        
        passcomTF.addTarget(self, action: #selector(confirmCheck), for: .editingChanged)
        passcomTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        
        numberTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        confirmBtn.addTarget(self, action: #selector(isValid), for: .touchUpInside)
        
       
       
        
    }
    
    @objc func duplicateCheck(_ sender: UITextField) {
        
        
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
        
        if (nameTF.text?.isEmpty)! || (passTF.text?.isEmpty)! || (emailTF.text?.isEmpty)! || (passcomTF.text?.isEmpty)! || (numberTF.text?.isEmpty)! || emailCheck.image == UIImage(named: "Yes") || passCheck.image == UIImage(named: "Yes") || check == 0 {
        
            JoinBtn.isEnabled = false
            JoinBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            
        }
        else {
            if passCheck.image == UIImage(named: "Yes-Color") && passCheck.image == UIImage(named: "Yes-Color") && check == 1{
            
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
        
        let mainview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "favoriteview")
        
        navigationController?.pushViewController(mainview, animated: true)
    }
    
    

}
