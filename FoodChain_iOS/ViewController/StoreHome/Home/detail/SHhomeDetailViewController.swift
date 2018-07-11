//
//  SHhomeDetailViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 7..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class SHhomeDetailViewController: UIViewController {

    @IBOutlet weak var detailImg: UIImageView!
    @IBOutlet weak var detailInfoView: UIView!
    @IBOutlet weak var productLB: UILabel!
    @IBOutlet weak var discountLB: UILabel!
    @IBOutlet weak var discountpriceLB: UILabel!
    @IBOutlet weak var originalpriceLB: UILabel!
    @IBOutlet weak var fromLB: UILabel!
        
    
    @IBOutlet weak var detailTV: UITableView!
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        detailTV.delegate = self
        detailTV.dataSource = self
        let nib = UINib.init(nibName: "SHhomeDetailTableViewCell", bundle: nil)
        self.detailTV.register(nib, forCellReuseIdentifier: "detailCell")
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: #selector(SHhomeDetailViewController.back(sender:)))
        
        newBackButton.setBackgroundImage(#imageLiteral(resourceName: "Back"), for: .normal, barMetrics: .default)
        self.navigationItem.leftBarButtonItem = newBackButton
        
        
        

        
   
    }
    @objc func back(sender: UIBarButtonItem) {
        
        navigationController?.popViewController(animated: true)
    }

    

}
extension SHhomeDetailViewController : UITableViewDelegate{
    
}
extension SHhomeDetailViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! SHhomeDetailTableViewCell
            
      
       
        return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! SHhomeMenuTableViewCell
            
            return cell
            
        }
        
    }
    
    
}
