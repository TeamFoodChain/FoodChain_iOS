//
//  TermViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 3..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class TermViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: #selector(TermViewController.back(sender:)))
        
        newBackButton.setBackgroundImage(#imageLiteral(resourceName: "Back"), for: .normal, barMetrics: .default)
        self.navigationItem.leftBarButtonItem = newBackButton

    }
    
    @objc func back(sender: UIBarButtonItem) {
        
        
        
        navigationController?.popViewController(animated: true)
    }

    
}
