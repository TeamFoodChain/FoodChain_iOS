//
//  FavoriteViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 1..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit



class FavoriteViewController: UIViewController {
    

    var estimateWidth = 150.0
    var cellMarginSize = 10.0
    var selectcount:Int  = 0
    
    let choiceManager = ChoiceNM()
    
    //    let imgarray : [String:UIImage] = ["0_a": #imageLiteral(resourceName: "962.png") , "0_b": #imageLiteral(resourceName: "icon2") ,"1_a": #imageLiteral(resourceName: "967.png") ,"1_b": #imageLiteral(resourceName: "952.png") ,"1_c": #imageLiteral(resourceName: "965.png") ,"1_d": #imageLiteral(resourceName: "955.png") ,"2": #imageLiteral(resourceName: "971.png") ,"3_a": #imageLiteral(resourceName: "961.png") ,"3_b": #imageLiteral(resourceName: "970.png") ,"3_c": #imageLiteral(resourceName: "960.png") ,"4": #imageLiteral(resourceName: "969.png") ,"5_a": #imageLiteral(resourceName: "959.png") , "5_b":#imageLiteral(resourceName: "963.png") ,"6_a": #imageLiteral(resourceName: "958.png") ,"6_b": #imageLiteral(resourceName: "966.png") ,"6_c": #imageLiteral(resourceName: "957.png") , "6_d":#imageLiteral(resourceName: "968.png") , "6_e":#imageLiteral(resourceName: "956.png") , "7_a":#imageLiteral(resourceName: "964.png") , "7:b":#imageLiteral(resourceName: "953.png") ]

    let imgarray = [#imageLiteral(resourceName: "962.png"),#imageLiteral(resourceName: "icon2"),#imageLiteral(resourceName: "967.png"),#imageLiteral(resourceName: "952.png"),#imageLiteral(resourceName: "965.png"),#imageLiteral(resourceName: "955.png"),#imageLiteral(resourceName: "971.png"),#imageLiteral(resourceName: "961.png"),#imageLiteral(resourceName: "970.png"),#imageLiteral(resourceName: "960.png"),#imageLiteral(resourceName: "969.png"),#imageLiteral(resourceName: "959.png"),#imageLiteral(resourceName: "963.png"),#imageLiteral(resourceName: "958.png"),#imageLiteral(resourceName: "966.png"),#imageLiteral(resourceName: "957.png"),#imageLiteral(resourceName: "968.png"),#imageLiteral(resourceName: "956.png"),#imageLiteral(resourceName: "964.png"),#imageLiteral(resourceName: "953.png")]
    let dataarray  = ["0_a","0_b","1_a","1_b","1_c","1_d","2","3_a","3_b","3_c","4","5_a","5_b","6_a","6_b","6_c","6_d","6_e","7_a","7:b"]
    
    @IBOutlet weak var FavoriteCollectionView: UICollectionView!
    @IBOutlet weak var SendFavoriteBtn: UIBarButtonItem!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        SendFavoriteBtn.isEnabled = false
   
        FavoriteCollectionView.dataSource = self 
        FavoriteCollectionView.delegate = self
        FavoriteCollectionView.allowsMultipleSelection = true
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
       
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: #selector(FavoriteViewController.back(sender:)))
        
        newBackButton.setBackgroundImage(#imageLiteral(resourceName: "Back"), for: .normal, barMetrics: .default)
        self.navigationItem.leftBarButtonItem = newBackButton


    }
    
    @objc func back(sender: UIBarButtonItem) {
         dismiss(animated: true, completion: nil)
    }

    @IBAction func SendFavoriteAction(_ sender: Any) {
        
       
        let item1 = FavoriteCollectionView.indexPathsForSelectedItems![0][1]
        let item2 = FavoriteCollectionView.indexPathsForSelectedItems![1][1]
        
        
        var sendarray:[String] = []
        sendarray.append(gsno(dataarray[item1]))
        sendarray.append(gsno(dataarray[item2]))
        
            
        
        print(sendarray)
        
        choiceManager.favoritechoice(pro_cate: sendarray) {[weak self] (cho) in
            if cho.message == "Success to Register"{
            
                self?.dismiss(animated: true, completion: nil)
            }
            else if cho.message == "Exceed of Information" || cho.message ==  "Internal Server Error"{
                let alertController = UIAlertController(title: "",message: "네트워크 문제입니다.", preferredStyle: UIAlertControllerStyle.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
                
            }
            
        }
   
        }
        

}

extension FavoriteViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imgarray.count
    
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoritecell", for: indexPath) as! FavoriteCollectionViewCell
        cell.favoriteImg.image = imgarray[indexPath.row]
        
        return cell
        
       
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
      
        
    
        selectcount += 1
        
        if selectcount != 2{
            
            SendFavoriteBtn.isEnabled = false
        }
        else{
            
            SendFavoriteBtn.isEnabled = true
        }
       
        
       
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        selectcount -= 1
       
       if selectcount != 2{
            SendFavoriteBtn.isEnabled = false
        }
       else{
         SendFavoriteBtn.isEnabled = true
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
