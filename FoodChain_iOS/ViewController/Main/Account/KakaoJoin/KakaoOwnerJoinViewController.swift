//
//  KakaoOwnerJoinViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 4..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class KakaoOwnerJoinViewController: UIViewController, addressDelegate {

    var kakaoUserId :String = ""
    var KakaoNickname:String = ""
    var check: Int = 0
    
    var geolong :String = ""
    var geolat : String = ""
    
    
    @IBOutlet weak var ownernameTF: UITextField!
    @IBOutlet weak var owneremailTF: UITextField!
    @IBOutlet weak var ownernumberTF: UITextField!
    @IBOutlet weak var companynumTF: UITextField!
    @IBOutlet weak var companyadress1TF: UITextField!
    @IBOutlet weak var companynameTF: UITextField!
    @IBOutlet weak var emailCheck: UIImageView!
    @IBOutlet weak var comnumCheck: UIImageView!
    @IBOutlet weak var termCheck: UIButton!
    @IBOutlet weak var JoinBtn: UIButton!
    @IBOutlet weak var phoneCheck: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(kakaoUserId)
        print(KakaoNickname)
        
        ownernameTF.setBottomBorder()
        owneremailTF.setBottomBorder()
        ownernumberTF.setBottomBorder()
        companynumTF.setBottomBorder()
        companyadress1TF.setBottomBorder()
        companynameTF.setBottomBorder()
        
        initAddTarget()
        
        JoinBtn.isEnabled = false
        JoinBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)

        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: #selector(KakaoOwnerJoinViewController.back(sender:)))
        
        newBackButton.setBackgroundImage(#imageLiteral(resourceName: "Back"), for: .normal, barMetrics: .default)
        self.navigationItem.leftBarButtonItem = newBackButton
        
    }
    
    func Response(address: String, long: String, lat: String) {
        companyadress1TF.text = address
        companyadress1TF.sizeToFit()
        print(long)
        print(lat)
        geolong = long
        geolat = lat
    }
    
    func initAddTarget(){
        
        owneremailTF.addTarget(self, action: #selector(duplicateCheck), for: .editingChanged)
        
        ownernameTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        owneremailTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        ownernumberTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        companynumTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        companyadress1TF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        companynameTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        termCheck.addTarget(self, action: #selector(isValid), for: .touchUpInside)
        
        
        
        
    }
    
    @objc func duplicateCheck(_ sender: UITextField) {
        
        
    }
    
    
    @objc func isValid(){
        
        if (ownernameTF.text?.isEmpty)! || (owneremailTF.text?.isEmpty)! || (ownernumberTF.text?.isEmpty)! || (companynumTF.text?.isEmpty)! || (companyadress1TF.text?.isEmpty)! || (companynameTF.text?.isEmpty)! || emailCheck.image == #imageLiteral(resourceName: "Yes") || comnumCheck.image == #imageLiteral(resourceName: "Yes") || phoneCheck.image == #imageLiteral(resourceName: "Yes") || check == 0 {
            
            JoinBtn.isEnabled = false
            JoinBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            
        }
        else {
            if check == 1{
                
                JoinBtn.isEnabled = true
                JoinBtn.backgroundColor = #colorLiteral(red: 0.2158766389, green: 0.6043385863, blue: 0.4158287644, alpha: 1)
                
            }
        }
    }
    
    @objc func back(sender: UIBarButtonItem) {
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchAddressAction(_ sender: Any) {
        
        let adsearchview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddressSearchView") as! SearchAdViewController
        adsearchview.delegate = self
        navigationController?.pushViewController(adsearchview, animated: true)
        
        
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
    @IBAction func KownerJoinAction(_ sender: Any){
        
        let join = JoinNM()
        join.nativeKakaoOwnerJoin(sup_pw: kakaoUserId, sup_name: gsno(ownernameTF.text), sup_email: gsno(owneremailTF.text), sup_phone: gsno(ownernumberTF.text), sup_regist_num: gsno(companynumTF.text), mar_name: gsno(companynameTF.text), mar_locate_lat: geolat, mar_locate_long: geolong, mar_addr: gsno(companyadress1TF.text), sup_id: kakaoUserId) { [weak self](Join) in
            if Join.message == "Success Signup"{
                
                let mainview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabbarview") as! TabBarViewController
                
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
    

}
