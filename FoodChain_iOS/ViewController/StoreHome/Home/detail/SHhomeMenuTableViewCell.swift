//
//  SHhomeMenuTableViewCell.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 9..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class SHhomeMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuCV: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        menuCV.delegate = self
        menuCV.dataSource = self
        // Initialization code
    }

  

}
extension SHhomeMenuTableViewCell: UICollectionViewDelegateFlowLayout{

}

extension SHhomeMenuTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCCell", for: indexPath) as! SHhomeMenuCollectionViewCell
        
     
        return cell
    }
    
}



