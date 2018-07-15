//
//  SHcategoryViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 7..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class SHcategoryViewController: UIViewController {

    
    var estimateWidth = 160.0
    var cellMarginSize = 10.0
    var gridline = 1
    
   
    var category:String = ""
    var categorynum :String = ""
    
    @IBOutlet weak var categoryTV: UICollectionView!
   
    var categoryObject : SHmainObject?
    let manager = StorehomeMainNM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(categorynum)
        categoryTV.delegate = self
        categoryTV.dataSource = self
        
        
        manager.getcategorydata(token: UserDefaults.standard.string(forKey: "usertoken")!, category: categorynum) {[weak self] (result) in
            if result.message == "Success to Get Data"
            {
                self?.categoryObject = result
                self?.categoryTV.reloadData()
            }
            else if result.message == "No Data"{
                
                let alertController = UIAlertController(title: "",message: "주변마켓의 상품정보가 없습니다.", preferredStyle: UIAlertControllerStyle.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
                
                
            }else{
                let alertController = UIAlertController(title: "",message: "네트워크 오류입니다.", preferredStyle: UIAlertControllerStyle.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
                
            }
        }
        
        
 
    }
    
    @IBAction func GridAction(_ sender: Any) {
        
        if  gridline == 1{
            
            
            
            gridline = 0
            categoryTV.reloadData()
        }
        else{
          
            gridline = 1
            categoryTV.reloadData()
            
        }
        
        
    }
    @IBAction func ListAction(_ sender: Any) {
        
        if  gridline == 1{
           
           
            gridline = 0
            categoryTV.reloadData()
        }
        else{
          
            gridline = 1
            categoryTV.reloadData()
            
        }
       
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
extension SHcategoryViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return gino(categoryObject?.data?.count)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if gridline == 1 {
        let headerview = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier:  "headerView", for: indexPath) as! SHcategoryHeaderCollectionReusableView
        headerview.categoryLB.text = category 
            headerview.categoryLB.sizeToFit()
        headerview.grid = gridline
            
        
        return headerview
        }else{
            let headerview = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier:  "headerView", for: indexPath) as! SHcategoryHeaderCollectionReusableView
            headerview.grid = gridline
            headerview.categoryLB.text = category
            headerview.categoryLB.sizeToFit()
          
            
            return headerview
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! SHcategoryCollectionViewCell
      
        let ori :Double = Double((categoryObject?.data![indexPath.row].pro_price)!)
        let sale: Double = Double((categoryObject?.data![indexPath.row].pro_sale_price)!)
        print(ori)
        print(sale)
        print(Int( floor((sale / ori) * 100)))
        
        cell.discountLB.text = String( 100 - Int( floor((sale / ori) * 100))) + "%"
        cell.discountLB.sizeToFit()
        cell.distanceLB.text = String(Int(floor((categoryObject?.data?[indexPath.row].dist)! * 1000))) + "m"
        cell.distanceLB.sizeToFit()
        cell.originalpriceLB.text = String(gino(categoryObject?.data?[indexPath.row].pro_price)) + "원"
        cell.originalpriceLB.sizeToFit()
        cell.priceLB.text = String(gino(categoryObject?.data?[indexPath.row].pro_sale_price)) + "원"
        cell.priceLB.sizeToFit()
        let url = URL(string: gsno(categoryObject?.data?[indexPath.row].pro_img))
        cell.productImg.kf.setImage(with: url)
        cell.productLB.text = categoryObject?.data?[indexPath.row].pro_name
          print(categoryObject?.data![indexPath.row].dist)    
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let nextview = UIStoryboard.init(name: "StoreHome", bundle: nil).instantiateViewController(withIdentifier: "detailView") as! SHhomeDetailViewController
        
        navigationController?.pushViewController(nextview, animated: true)
    }
    
}
extension SHcategoryViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
     
        
        if gridline == 1{
            
            let width = self.calculateWith()
            return CGSize(width: width, height: width + width/3)
            
        }
        else{
            let width = self.calculateWith()
        
            return CGSize(width: 2 * width + 10, height: (2 * width + 10 )+(2 * width + 10)/3 )
            
            
        }
       
        
    }
    
    func calculateWith() -> CGFloat {
        
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        
        return width
    }
    
    
    
}



