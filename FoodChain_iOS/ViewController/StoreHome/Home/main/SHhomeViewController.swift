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
    
    let mainManager = StorehomeMainNM()
    var mainObject : SHmainObject?
 
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
        

        
        self.mainManager.getmaindata(token: UserDefaults.standard.string(forKey: "usertoken")!, completion: {(maindata) in
            
            if maindata.message == "Success to Get Data"{
                
            self.mainObject = maindata
                
                
                if maindata.reco?.count == 0{
                    for i in 0..<5{
                    self.frame.origin.x = self.SHcategoryADView.frame.size.width * CGFloat(i)
                    self.frame.size = self.SHcategoryADView.frame.size
                    let imageview = UIImageView(frame: self.frame)
                    imageview.image = #imageLiteral(resourceName: "appimgEx")
                    self.SHcategoryADView.addSubview(imageview)
                    
                    }
                }
                else{
                    for  index in 0..<self.gino(maindata.reco?.count){
                        self.frame.origin.x = self.SHcategoryADView.frame.size.width * CGFloat(index)
                        self.frame.size = self.SHcategoryADView.frame.size
                        self.SHcategoryADView.isScrollEnabled = true
                        self.pageControl.isHidden = false
                        let imageview = UIImageView(frame: self.frame)
                        let url = URL(string: self.gsno(self.mainObject?.reco?[index].pro_img))
                        imageview.kf.setImage(with: url)
                        self.SHcategoryADView.addSubview(imageview)
                        
                    }
                    
                }
            self.SHhomeTV.reloadData()
              
            }
            else if maindata.message == "No Data"{
                
                self.frame.origin.x = self.SHcategoryADView.frame.size.width * CGFloat(0)
                self.frame.size = self.SHcategoryADView.frame.size
                self.SHcategoryADView.isScrollEnabled = false
                self.pageControl.isHidden = true
                let imageview = UIImageView(frame: self.frame)
                imageview.image = #imageLiteral(resourceName: "appimgEx")
                self.SHcategoryADView.addSubview(imageview)
               
                
            }
            
        })
      

        
       

        
        
    
        SHcategoryADView.contentSize.width =  SHcategoryADView.frame.size.width * CGFloat(color.count)
        SHcategoryADView.alwaysBounceVertical = false
        SHcategoryADView.alwaysBounceHorizontal = false
        SHcategoryADView.delegate = self
        
     
        
        
        
    }
 

    @IBAction func Btn1Action(_ sender: Any) {
        
        gotoCategory(textstring: "채소/과일", categorynum: "0")
 
    }
    @IBAction func Btn2Action(_ sender: Any) {
         gotoCategory(textstring: "음료/차", categorynum: "1")
    }
    @IBAction func Btn3Action(_ sender: Any) {
         gotoCategory(textstring: "영양만땅", categorynum: "3")
    }
    
    @IBAction func Btn4Action(_ sender: Any) {
         gotoCategory(textstring: "수입과자", categorynum: "2")
    }
    @IBAction func Btn5Action(_ sender: Any) {
         gotoCategory(textstring: "술안주", categorynum: "4")
    }
    @IBAction func Btn6Action(_ sender: Any) {
         gotoCategory(textstring: "다이어트", categorynum: "5")
    }
    @IBAction func Btn7Action(_ sender: Any) {
         gotoCategory(textstring: "신선/가공", categorynum: "6")
    }
    
    @IBAction func Btn8Action(_ sender: Any) {
         gotoCategory(textstring: "반려동물", categorynum: "7")
    }
    
    func gotoCategory(textstring:String , categorynum :String){
        
        let nextview = UIStoryboard.init(name: "StoreHome", bundle: nil).instantiateViewController(withIdentifier: "categoryView") as! SHcategoryViewController
        nextview.category = textstring
        nextview.categorynum = categorynum
        
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
            if gino(mainObject?.data?.count) == 0 {
                
                return 1
                
            }
            else{
                
                return gino(mainObject?.data?.count)
                
                
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
     
        
        
        if indexPath.section == 0{
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "adCell") as! SHADTableViewCell
            return cell
            
           
        }
        else{
            if gino(mainObject?.data?.count) == 0{
                
                tableView.separatorColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell") as! DefaultTableViewCell
                cell.infoLB.text = "위치에 기반한 상품이 없습니다."
                
                return cell
                
            }else{
                
                tableView.separatorColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "SHhomeCell") as! SHhomeTableViewCell
                
                let ori :Double = Double((mainObject?.data![indexPath.row].pro_price)!)
                let sale: Double = Double((mainObject?.data![indexPath.row].pro_sale_price)!)
                print(ori)
                print(sale)
                print(Int( floor((sale / ori) * 100)))
              
               
                print(mainObject?.data![indexPath.row].dist)                                     
                let url = URL(string: gsno(mainObject?.data![indexPath.row].pro_img))
                cell.productImg.kf.setImage(with: url)
                cell.productname.text = mainObject?.data![indexPath.row].pro_name
                cell.productname.sizeToFit()
                cell.price.text = String(gino(mainObject?.data![indexPath.row].pro_sale_price)) + "원"
                cell.price.sizeToFit()
                cell.oriprice.text = String(gino(mainObject?.data![indexPath.row].pro_price)) + "원"
                cell.oriprice.sizeToFit()
                cell.discountper.text = String(100 - Int(floor((sale / ori) * 100))) + "%"
                cell.discountper.sizeToFit()
                
                return cell
                
            }
            
            
        }
    }
    
 
}

extension SHhomeViewController : UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
       
        
        if indexPath.section != 0{
            
            if gino(mainObject?.data?.count) == 0{
                
            }else{
                
                let nextview = UIStoryboard.init(name: "StoreHome", bundle: nil).instantiateViewController(withIdentifier: "detailView") as! SHhomeDetailViewController
                
                navigationController?.pushViewController(nextview, animated: true)
                
            }
            
        }
        else{
            
        }
        
    }
  
    
}
