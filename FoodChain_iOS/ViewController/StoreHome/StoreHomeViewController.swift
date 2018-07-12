//
//  StoreHomeViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 1..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit
import Parchment

class StoreHomeViewController: UIViewController {


   let token =  UserDefaults.standard.string(forKey: "usertoken")
    let cate_flag = UserDefaults.standard.integer(forKey: "cate_flag")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
       print(token)
        print(cate_flag)
       if cate_flag == 0{
            
            let favoriteView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "favoriteview")
            
            navigationController?.pushViewController(favoriteView, animated: true)
            
        }

        
        
        //- Pageview Library 코드
        let storyboard = UIStoryboard(name: "StoreHome", bundle: nil)
        
        let firstViewController = storyboard.instantiateViewController(withIdentifier: "home") as! SHhomeViewController
        
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "timesale") as! SHtimesaleViewController
        
        let thirdViewController = storyboard.instantiateViewController(withIdentifier: "market")
        
        
        let pagingViewController = FixedPagingViewController(viewControllers: [
            firstViewController,
            secondViewController,
            thirdViewController
            ])
    
        
        
        
        addChildViewController(pagingViewController)
        view.addSubview(pagingViewController.view)
        
        pagingViewController.didMove(toParentViewController: self)
        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
       
        pagingViewController.indicatorColor = #colorLiteral(red: 0.2158766389, green: 0.6043385863, blue: 0.4158287644, alpha: 1)
        pagingViewController.selectedTextColor = #colorLiteral(red: 0.2158766389, green: 0.6043385863, blue: 0.4158287644, alpha: 1)
        pagingViewController.menuItemSize = PagingMenuItemSize.sizeToFit(minWidth: self.view.layer.bounds.width/3, height: 30)
       
        
        
    
        
        NSLayoutConstraint.activate([
            pagingViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pagingViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pagingViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pagingViewController.view.topAnchor.constraint(equalTo: view.topAnchor)
            ])
        //
        
       
        
            
    }
  
    
  
    

   

}

