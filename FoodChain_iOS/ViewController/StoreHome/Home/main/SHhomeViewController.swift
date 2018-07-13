//
//  SHhomeViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 4..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit
import Parchment
import Kingfisher

class SHhomeViewController: UIViewController ,UIScrollViewDelegate{

    @IBOutlet weak var SHhomeTV: UITableView!
    @IBOutlet weak var SHcategoryADView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btn1: UIButton!
    
    
    var maindata : SHmainObject?
 
    var color :[UIColor] = [UIColor.blue ,UIColor.black,UIColor.red,UIColor.gray]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
      

        SHhomeTV.dataSource = self
        SHhomeTV.delegate = self
        
        let nib = UINib.init(nibName: "DefaultTableViewCell", bundle: nil)
        self.SHhomeTV.register(nib, forCellReuseIdentifier: "defaultCell")
        
        pageControl.numberOfPages = color.count
        SHcategoryADView.frame.size.width = view.frame.size.width
    
      
        
        if maindata != nil{
            for index in 0..<(maindata?.data?.count)!{
                
                frame.origin.x = SHcategoryADView.frame.size.width * CGFloat(index)
                frame.size = SHcategoryADView.frame.size
                let imageview = UIImageView(frame: frame)
                let url = URL(string: (maindata?.reco?[0].pro_img)!)
                imageview.kf.setImage(with: url)
                self.SHcategoryADView.addSubview(imageview)
            }
            
        }else{
             for index in 0..<color.count{
               
                frame.origin.x = SHcategoryADView.frame.size.width * CGFloat(index)
                frame.size = SHcategoryADView.frame.size
                let imageview = UIImageView(frame: frame)
                imageview.image = #imageLiteral(resourceName: "appimgEx")
                self.SHcategoryADView.addSubview(imageview)
            }
            
        }
        
    
        SHcategoryADView.contentSize.width =  SHcategoryADView.frame.size.width * CGFloat(color.count)
        SHcategoryADView.alwaysBounceVertical = false
        SHcategoryADView.alwaysBounceHorizontal = false
        SHcategoryADView.delegate = self
        
        
        
        
    }
 

    @IBAction func Btn1Action(_ sender: Any) {
        
        gotoCategory()
 
    }
    @IBAction func Btn2Action(_ sender: Any) {
         gotoCategory()
    }
    @IBAction func Btn3Action(_ sender: Any) {
         gotoCategory()
    }
    
    @IBAction func Btn4Action(_ sender: Any) {
         gotoCategory()
    }
    @IBAction func Btn5Action(_ sender: Any) {
         gotoCategory()
    }
    @IBAction func Btn6Action(_ sender: Any) {
         gotoCategory()
    }
    @IBAction func Btn7Action(_ sender: Any) {
         gotoCategory()
    }
    
    @IBAction func Btn8Action(_ sender: Any) {
         gotoCategory()
    }
    
    func gotoCategory(){
        
        let nextview = UIStoryboard.init(name: "StoreHome", bundle: nil).instantiateViewController(withIdentifier: "categoryView") as! SHcategoryViewController
        addChildViewController(nextview)
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        nextview.view.layer.add(transition, forKey: kCATransition)
        nextview.view.frame.size.height = view.frame.height
        self.view.addSubview(nextview.view)
        
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = SHcategoryADView.contentOffset.x / SHcategoryADView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    @IBAction func pagingAction(_ sender: UIPageControl) {
        
        let x = CGFloat(sender.currentPage) * SHcategoryADView.frame.size.width
        SHcategoryADView.contentOffset = CGPoint(x: x, y: 0)
      
    }
  


}
extension SHhomeViewController : UITableViewDataSource{
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            
            return 78
            
        }
        else{
            return self.view.frame.size.width
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            return 1
        }
        else{
            if maindata != nil{
                 return gino(maindata?.data?.count)
                
            }
            else{
                return 1
            }
            
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "adCell") as! SHADTableViewCell
            return cell
            
           
        }
        else{
            if maindata == nil{
                tableView.separatorColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell") as! DefaultTableViewCell
                cell.infoLB.text = "위치에 기반한 상품이 없습니다."
                
                return cell
                
            }else{
                tableView.separatorColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                let cell = tableView.dequeueReusableCell(withIdentifier: "SHhomeCell") as! SHhomeTableViewCell
                cell.oriprice.text = String( gino(maindata?.data![indexPath.row].pro_price))
                cell.price.text = String(gino(maindata?.data![indexPath.row].pro_sale_price))
                cell.productname.text =  maindata?.data![indexPath.row].pro_name
                cell.discountper.text = String(gino(maindata?.data![indexPath.row].pro_sale_price)/gino(maindata?.data![indexPath.row].pro_price)*100)
                return cell
                
            }
            
        }
    }
    
 
}

extension SHhomeViewController : UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            
            }else{
            if maindata?.data?.count != 0{
            let nextview = UIStoryboard.init(name: "StoreHome", bundle: nil).instantiateViewController(withIdentifier: "detailView") as! SHhomeDetailViewController
            
            navigationController?.pushViewController(nextview, animated: true)
            
            }
            
        }
    }
  
    
}
