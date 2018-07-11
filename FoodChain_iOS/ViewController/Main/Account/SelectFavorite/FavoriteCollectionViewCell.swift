//
//  FavoriteCollectionViewCell.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 1..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit


class FavoriteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var favoriteLB: UILabel!
    
    @IBOutlet weak var favoriteImg: UIImageView!
    override func awakeFromNib() {
        self.layer.cornerRadius = 10.0
        favoriteImg.layer.cornerRadius = 10.0
        
    }
    
    
    override var isSelected: Bool {
        didSet {
            if isSelected { // Selected cell
                self.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    
            } else { // Normal cell
                self.backgroundColor = #colorLiteral(red: 0.2158766389, green: 0.6043385863, blue: 0.4158287644, alpha: 1)
              
                
            }
            
        }
        
    }

}
