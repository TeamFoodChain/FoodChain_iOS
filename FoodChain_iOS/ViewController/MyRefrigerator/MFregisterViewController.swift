//
//  MFregisterViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 9..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class MFregisterViewController: UIViewController {

   
    @IBOutlet weak var timesalenoticeLB: UILabel!
    @IBOutlet weak var productTF: UITextField!
    @IBOutlet weak var productnameTF: UITextField!
    @IBOutlet weak var enddateTF: UITextField!
    @IBOutlet weak var endtimeTF: UITextField!
    @IBOutlet weak var endtimeTF2: UITextField!
    @IBOutlet weak var timesailBtn: UIButton!
    
    @IBOutlet weak var productImg: UIImageView!
    
    var quizanswer:Int = 0
    var quizansernum:Int = 0
    var keyboardHeight : CGFloat = 0
    
    var photo : UIImage!
    var flag = 0
    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
//        let rect = CGRect(x: 10, y: 10, width: 100, height: 100)
//        let myView = UIView(frame: rect)
//
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        productImg.image = photo
        
        productTF.setBottomBorder()
        productnameTF.setBottomBorder()
        enddateTF.setBottomBorder()
        endtimeTF.setBottomBorder()
        endtimeTF2.setBottomBorder()
        endtimeTF.isHidden = true
        endtimeTF2.isHidden = true
        
        showDatePicker()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 ||
                (keyboardHeight != keyboardSize.height/2)
            {
                print(keyboardSize.height)
                self.view.frame.origin.y = 0
                self.view.frame.origin.y -= keyboardSize.height/2 - 5
                keyboardHeight = keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
            if self.view.frame.origin.y != 0 {
                
                self.view.frame.origin.y = (navigationController?.navigationBar.frame.height)! + UIApplication.shared.statusBarFrame.height //keyboardSize.height/2
            }
        
    }

    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        enddateTF.inputAccessoryView = toolbar
        enddateTF.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        enddateTF.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    @IBAction func timesailAction(_ sender: Any) {
        if flag == 0{
        timesailBtn.setImage(#imageLiteral(resourceName: "clockIcon"), for: .normal)
        timesalenoticeLB.text = "타임세일 시간을 입력해주세요!"
        endtimeTF.isHidden = false
        endtimeTF2.isHidden = false
            flag = 1
        }
        else{
            timesailBtn.setImage(#imageLiteral(resourceName: "clockIcogrey"), for: .normal)
            timesalenoticeLB.text = "타임 세일을 하고 싶다면 눌러주세요!"
            endtimeTF.isHidden = true
            endtimeTF2.isHidden = true
            flag = 0
            
        }
        
    }
    
    @IBAction func nextAction(_ sender: Any) {
        let nextview = UIStoryboard.init(name: "MyRefrigerator", bundle: nil).instantiateViewController(withIdentifier: "registeraddView") as! MFregister2ViewController
        nextview.img = productImg.image
        navigationController?.pushViewController(nextview, animated: true)
    }
    

}
