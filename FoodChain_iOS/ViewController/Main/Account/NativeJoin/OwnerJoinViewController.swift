//
//  OwnerJoinViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 4..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class OwnerJoinViewController: UIViewController,  addressDelegate{
 
    let joinManager = JoinNM()

    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var JoinBtn: UIButton!
    @IBOutlet weak var ownerNameTF: UITextField!
    @IBOutlet weak var owneremailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var passcomTF: UITextField!
    @IBOutlet weak var ownernumberTF: UITextField!
    @IBOutlet weak var companynumberTF: UITextField!
    @IBOutlet weak var companynameTF: UITextField!
    @IBOutlet weak var companyad1TF: UITextField!
    @IBOutlet weak var emailcheck: UIImageView!
    @IBOutlet weak var passcheck: UIImageView!
    @IBOutlet weak var phonecheck: UIImageView!
    @IBOutlet weak var companynumcheck: UIImageView!
    
    var check :Int = 0
    var geolong :String = ""
    var geolat : String = ""
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ownerNameTF.setBottomBorder()
        owneremailTF.setBottomBorder()
        passTF.setBottomBorder()
        passcomTF.setBottomBorder()
        ownernumberTF.setBottomBorder()
        companynumberTF.setBottomBorder()
        companynameTF.setBottomBorder()
        companyad1TF.setBottomBorder()
        
        initAddTarget()
        
        JoinBtn.isEnabled = false
        JoinBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: #selector(OwnerJoinViewController.back(sender:)))
        
        newBackButton.setBackgroundImage(#imageLiteral(resourceName: "Back"), for: .normal, barMetrics: .default)
        self.navigationItem.leftBarButtonItem = newBackButton
    }
   
    func Response(address: String, long: String, lat: String) {
        companyad1TF.text = address
        companyad1TF.sizeToFit()
        print(long)
        print(lat)
        geolong = long
        geolat = lat
    }

    
    func initAddTarget(){
        
        
        
        ownerNameTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        
        
        owneremailTF.addTarget(self, action: #selector(emailCheckcall), for: .editingChanged)
        owneremailTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        
        passTF.addTarget(self, action: #selector(confirmCheck), for: .editingChanged)
        passTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        
        passcomTF.addTarget(self, action: #selector(confirmCheck), for: .editingChanged)
        passcomTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        
        ownernumberTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        ownernumberTF.addTarget(self, action: #selector(numberCheckcall), for: .editingChanged)
        
        companynumberTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        companynumberTF.addTarget(self, action: #selector(companynumbercheck), for: .editingChanged)
        
        companynameTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        companyad1TF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        confirmBtn.addTarget(self, action: #selector(isValid), for: .touchUpInside)
        
        
        
        
    }
    @IBAction func addressAction(_ sender: Any) {
        
        let adsearchview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddressSearchView") as! SearchAdViewController
        adsearchview.delegate = self
        navigationController?.pushViewController(adsearchview, animated: true)
        
        
    }
    
    
    @objc func emailCheckcall(_ sender: UITextField) {
        
        if owneremailTF.text?.isEmpty == false{
            
            joinManager.emailcheck(email: gsno(owneremailTF.text)) { [weak self](emailchecking) in
                
                if emailchecking.message == "Success Email Check"{
                    
                    self?.emailcheck.image = #imageLiteral(resourceName: "Yes-Color")
                    
                }
                else if emailchecking.message == "This Email Already Exists." || emailchecking.message == "Invalid Data"{
                    
                    self?.emailcheck.image = #imageLiteral(resourceName: "Yes")
                    
                    
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
    
    @objc func numberCheckcall(_ sender: UITextField){
        
        if ownernumberTF.text?.isEmpty == false{
            
            joinManager.phonecheck(number: gsno(ownernumberTF.text)) {[weak self] (numberchecking) in
                
                if numberchecking.message == "Success Phone Number Check"{
                    
                    self?.phonecheck.image = #imageLiteral(resourceName: "Yes-Color")
                    
                }
                else if numberchecking.message == "This Phone Number Already Exists." || numberchecking.message == "Invalid Data"{
                    
                    self?.phonecheck.image = #imageLiteral(resourceName: "Yes")
                    
                    
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
    
    @objc func companynumbercheck(_ sender: UITextField){
        
        if companynumberTF.text?.isEmpty == false{
            
            joinManager.companynumcheck(companynumber: gsno(companynumberTF.text)){[weak self] (comNum) in
                
                if comNum.message == "Success Sup_regist_num Check"{
                    
                    self?.companynumcheck.image = #imageLiteral(resourceName: "Yes-Color")
                    
                }
                else if comNum.message == "This Sup_regist_num Already Exists." || comNum.message == "Invalid Data"{
                    print(comNum.message)
                    self?.companynumcheck.image = #imageLiteral(resourceName: "Yes")
                    
                    
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
    
    @objc func confirmCheck() {
        if (passTF.text?.isEmpty)! && (passcomTF.text?.isEmpty)!{
            passcheck.image = UIImage(named: "Yes")
            
        }
        else{
            if passTF.text == passcomTF.text {
                passcheck.image = UIImage(named: "Yes-Color")
                
            }
            else{
                passcheck.image = UIImage(named: "Yes")
                
            }
            
        }
        
    }
    
    @objc func isValid(){
        
        if (ownerNameTF.text?.isEmpty)! || (passTF.text?.isEmpty)! || (owneremailTF.text?.isEmpty)! || (passcomTF.text?.isEmpty)! || (ownernumberTF.text?.isEmpty)! ||
            (companyad1TF.text?.isEmpty)!||(companynameTF.text?.isEmpty)!||(companynumberTF.text?.isEmpty)!||passcheck.image == #imageLiteral(resourceName: "Yes") || emailcheck.image == #imageLiteral(resourceName: "Yes") || phonecheck.image == #imageLiteral(resourceName: "Yes") || companynumcheck.image == #imageLiteral(resourceName: "Yes") || check == 0 {
            
            JoinBtn.isEnabled = false
            JoinBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            
        }
        else {
            if passcheck.image == UIImage(named: "Yes-Color") && check == 1{
                
                JoinBtn.isEnabled = true
                JoinBtn.backgroundColor = #colorLiteral(red: 0.2158766389, green: 0.6043385863, blue: 0.4158287644, alpha: 1)
                
            }
        }
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
       
        
        joinManager.nativeOwnerJoin(sup_pw: gsno(passTF.text), sup_name: gsno(ownerNameTF.text), sup_email: gsno(owneremailTF.text), sup_phone: gsno(ownernumberTF.text), sup_regist_num: gsno(companynumberTF.text), mar_name: gsno(companynameTF.text), mar_locate_lat: geolong, mar_locate_long: geolat, mar_addr: gsno(companyad1TF.text)) { [weak self](Join) in
            if Join.message == "Success Signup"{
                
                let mainview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabbarview") as! TabBarViewController
             
                
                let userdata = UserDefaults.standard
                userdata.set(Join.token, forKey: "usertoken")
                userdata.set(Join.cate_flag, forKey: "cate_flag")
                userdata.set(1, forKey: "identify")
                userdata.set(Join.locate_flag,forKey: "selectlocation")
                userdata.synchronize()
                
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
    
    
    
    @objc func back(sender: UIBarButtonItem) {
        
        navigationController?.popViewController(animated: true)
    }
        
        
    

   

}
