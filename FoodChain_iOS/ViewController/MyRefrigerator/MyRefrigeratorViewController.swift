//
//  MyRefrigeratorViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 9..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit
import Parchment

class MyRefrigeratorViewController: UIViewController ,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let picker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
         picker.delegate = self
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        
        //- Pageview Library 코드
        let first = UIStoryboard.init(name: "MyRefrigerator", bundle: nil).instantiateViewController(withIdentifier: "exdateView")
        let second = UIStoryboard.init(name: "MyRefrigerator", bundle: nil).instantiateViewController(withIdentifier: "uploadstoreView")
        
        
        if  UserDefaults.standard.integer(forKey: "identify") == 0{
            
            addChildViewController(first)
            view.addSubview(first.view)
            
            
            
            
            
        }else{
           
            
            
            let pagingViewController = FixedPagingViewController(viewControllers: [
                first,
                second
                ])
            
            
            addChildViewController(pagingViewController)
            view.addSubview(pagingViewController.view)
            
            pagingViewController.didMove(toParentViewController: self)
            pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
            
            pagingViewController.indicatorColor = #colorLiteral(red: 0.2158766389, green: 0.6043385863, blue: 0.4158287644, alpha: 1)
            pagingViewController.selectedTextColor = #colorLiteral(red: 0.2158766389, green: 0.6043385863, blue: 0.4158287644, alpha: 1)
            pagingViewController.menuItemSize = PagingMenuItemSize.sizeToFit(minWidth: self.view.layer.bounds.width/2, height: 30)
            
            
            NSLayoutConstraint.activate([
                pagingViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                pagingViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                pagingViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                pagingViewController.view.topAnchor.constraint(equalTo: view.topAnchor)
                ])
            
            
        }
        
        
        
        //

    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image : UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        let registerview = UIStoryboard.init(name: "MyRefrigerator", bundle: nil).instantiateViewController(withIdentifier: "registerView") as! MFregisterViewController
        
        registerview.photo = image
        
        dismiss(animated: true, completion: nil)
        navigationController?.pushViewController(registerview, animated: true)
        
    }
        

    @IBAction func addproductAction(_ sender: Any) {
        
        picker.allowsEditing = true
        picker.sourceType = .camera
        present(picker, animated: true, completion: nil)
        
        
    }
    @IBAction func deleteaction(_ sender: Any) {
        
        let first = UIStoryboard.init(name: "MyRefrigerator", bundle: nil).instantiateViewController(withIdentifier: "exdateView") as! ExdateViewController
        
        first.deleteresponser = 1
        
        
       
    }
    
    

}

