//
//  MFregister2ViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 10..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class MFregister2ViewController: UIViewController ,UITextViewDelegate {
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productLB: UILabel!
    @IBOutlet weak var fromTF: UITextField!
    @IBOutlet weak var originalTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    @IBOutlet weak var descriptionTV: UITextView!
    
    
    
    
    var productTF:String = ""
    var productnameTF:String = ""
    var enddateTF:String = ""
    var endtimeTF:String = ""
    var endtimeTF2:String = ""

    
    var keyboardHeight : CGFloat = 0
    var img :UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()

        productImg.image = img
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        fromTF.setBottomBorder()
        originalTF.setBottomBorder()
        priceTF.setBottomBorder()
        descriptionTV.layer.borderWidth = 1.0
        descriptionTV.layer.borderColor = #colorLiteral(red: 0.2158766389, green: 0.6043385863, blue: 0.4158287644, alpha: 1)
        descriptionTV.delegate = self
        descriptionTV.text = "상품설명"
        descriptionTV.textColor = UIColor.lightGray
        descriptionTV.selectedTextRange = descriptionTV.textRange(from: descriptionTV.beginningOfDocument, to: descriptionTV.beginningOfDocument)
        
       
        
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
     
        let currentText:String = textView.text
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)
        
        if updatedText.isEmpty {
            
            textView.text = "상품설명"
            textView.textColor = UIColor.lightGray
            
            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
        }
            
        else if textView.textColor == UIColor.lightGray && !text.isEmpty {
            textView.textColor = UIColor.black
            textView.text = text
        }
            
        
        else {
            return true
        }
        
        
        return false
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        if self.view.window != nil {
            if textView.textColor == UIColor.lightGray {
                textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
            }
        }
    }
    
    @IBAction func sendData(_ sender: Any) {
        
        if UserDefaults.standard.integer(forKey: "timesale") == 0{
            
        }
        else if UserDefaults.standard.integer(forKey: "timesale") == 1{
            
            
        }
        
        
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
