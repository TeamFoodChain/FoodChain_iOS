//
//  SHcategoryViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 7..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class SHcategoryViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

  
    @IBAction func back(_ sender: Any) {
       

        UIView.animate(withDuration: 0.5 as TimeInterval, animations: {
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromLeft
            transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
            self.parent?.view.layer.add(transition, forKey: kCATransition)
        }, completion: {
            finished in
           
            self.view.removeFromSuperview()
        
        })
     

      
    
    
    
        

    }
    
    

}
