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

    
    let loginview = LoginViewController()
    let userdata = UserDefaults.standard
    let titleimg: UIImage = UIImage(named: "logo11")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        let token = userdata.string(forKey: "usertoken")
        let cate_flag = userdata.integer(forKey: "cate_flag")
        let identify = userdata.integer(forKey: "identify")
        let selectlocation = userdata.integer(forKey:"selectlocation")
        
      
        
        print(token)
        print(cate_flag)
        print(identify)
        print(selectlocation)
        
        
       navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
       
        navigationItem.titleView = UIImageView.init(image: titleimg)
        
        
        
        if selectlocation == 0 {
            let alert = UIAlertController(title: "동네를 설정하고 EAT DA 를 시작하세요", message: "많은 상품들이 당신의 주변에서 기다리고 있어요!", preferredStyle: .alert)
            let cancelButton = UIAlertAction(title: "둘러보기", style: .default, handler: nil)
            
            let action = UIAlertAction(title: "동네 설정하러가기", style: .default) {[weak self] (action) -> Void in
                let gotoselectloc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddressSearchView") as! SearchAdViewController
               gotoselectloc.validation = 1
                self?.navigationController?.pushViewController(gotoselectloc, animated: true)
            }
            alert.addAction(cancelButton)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            

        }
       if cate_flag == 0{

            let favoriteView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "favoritenaviview")

           present(favoriteView, animated: true, completion: nil)

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
    override func viewWillAppear(_ animated: Bool) {
       
    }
  
    
  
    

   

}


