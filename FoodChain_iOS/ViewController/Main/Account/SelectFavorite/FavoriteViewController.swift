//
//  FavoriteViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 1..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit



class FavoriteViewController: UIViewController {
    

    var estimateWidth = 160.0
    var cellMarginSize = 10.0
    var selectcount:Int  = 0
    
    
    @IBOutlet weak var FavoriteCollectionView: UICollectionView!
    @IBOutlet weak var SendFavoriteBtn: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    navigationController?.navigationBar.shadowImage = UIImage()
        
        SendFavoriteBtn.isEnabled = false
   
        FavoriteCollectionView.dataSource = self 
        FavoriteCollectionView.delegate = self
        FavoriteCollectionView.allowsMultipleSelection = true
        
       
        
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)


    }

    @IBAction func SendFavoriteAction(_ sender: Any) {
        
        let mainview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabbarview") as! TabBarViewController
        
        present(mainview, animated: true, completion: nil)
        
        
    }
    

}

extension FavoriteViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoritecell", for: indexPath) as! FavoriteCollectionViewCell
        cell.FavoriteLB.text = String(indexPath.row)
        
        return cell
        
       
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       
        selectcount += 1
        if selectcount >= 3{
            
            SendFavoriteBtn.isEnabled = true
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        
        selectcount -= 1
       if selectcount < 3{
            SendFavoriteBtn.isEnabled = false
        }
    }
    
   
    

    
}
extension FavoriteViewController: UICollectionViewDelegateFlowLayout{
    
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWith()
        return CGSize(width: width, height: width)
    }
    
    func calculateWith() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        
        return width
    }
    
    
    
}
