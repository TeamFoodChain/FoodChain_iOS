//
//  FavoriteCollectionViewCell.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 1..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit


class FavoriteCollectionViewCell: UICollectionViewCell {
  
    
    @IBOutlet weak var favoriteImg: UIImageView!
    @IBOutlet weak var selectImg: UIImageView!
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 25.0
        favoriteImg.layer.cornerRadius = 25.0
        
    }
    
    
    override var isSelected: Bool {
        didSet {
            if isSelected { // Selected cell
                self.selectImg.image = #imageLiteral(resourceName: "selectImg")
    
            } else { // Normal cell
                 self.selectImg.image = nil
              
                
            }
            
        }
        
    }

}
