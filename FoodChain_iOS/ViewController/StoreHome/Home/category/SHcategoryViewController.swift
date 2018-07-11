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
    

    
    @IBOutlet weak var categoryTV: UICollectionView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
        categoryTV.delegate = self
        categoryTV.dataSource = self
        
      
        
    
        
      
 
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
        
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerview = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier:  "headerView", for: indexPath) as! SHcategoryHeaderCollectionReusableView
        
        return headerview
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! SHcategoryCollectionViewCell
        
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
            return CGSize(width: width, height: width + 50)
            
        }
        else{
            let width = self.calculateWith()
        
            return CGSize(width: 2 * width + 10, height: width + 50)
            
            
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



