//
//  SHcategoryCollectionViewCell.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 8..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class SHcategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var distanceLB: UILabel!
    @IBOutlet weak var productLB: UILabel!
    @IBOutlet weak var discountLB: UILabel!
    @IBOutlet weak var priceLB: UILabel!
    @IBOutlet weak var originalpriceLB: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var distanceSV: UIStackView!
    
    
    @IBAction func likeAction(_ sender: Any) {
        
    }
    
}
