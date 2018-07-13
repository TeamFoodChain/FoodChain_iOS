//
//  SHhomeViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 4..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit
import Parchment

class SHhomeViewController: UIViewController ,UIScrollViewDelegate{

    @IBOutlet weak var SHhomeTV: UITableView!
    @IBOutlet weak var SHcategoryADView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btn1: UIButton!
    
 
  
 
    var color :[UIColor] = [UIColor.blue ,UIColor.black,UIColor.red,UIColor.gray]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SHhomeTV.dataSource = self
        SHhomeTV.delegate = self
        
        pageControl.numberOfPages = color.count
        
       SHcategoryADView.frame.size.width = view.frame.size.width
        print( SHcategoryADView.frame.size.width)
        for index in 0..<color.count{
            frame.origin.x = SHcategoryADView.frame.size.width * CGFloat(index)
            frame.size = SHcategoryADView.frame.size
            
            let view = UIView(frame: frame)
            view.backgroundColor = color[index]
            self.SHcategoryADView.addSubview(view)
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
            
        return 20
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "adCell") as! SHADTableViewCell
      
        
        return cell
        }
        else{
              let cell = tableView.dequeueReusableCell(withIdentifier: "SHhomeCell") as! SHhomeTableViewCell
           
            
            return cell
            
        }
    }
    
 
}

extension SHhomeViewController : UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            
            }else{
            let nextview = UIStoryboard.init(name: "StoreHome", bundle: nil).instantiateViewController(withIdentifier: "detailView") as! SHhomeDetailViewController
            
            navigationController?.pushViewController(nextview, animated: true)
            
        }
    }
  
    
}
