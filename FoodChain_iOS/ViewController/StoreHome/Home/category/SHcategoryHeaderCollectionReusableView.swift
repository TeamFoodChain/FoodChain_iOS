//
//  SHcategoryHeaderCollectionReusableView.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 8..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class SHcategoryHeaderCollectionReusableView: UICollectionReusableView {
    
    
    @IBOutlet weak var categoryLB: UILabel!
    @IBOutlet weak var grid4Btn: UIButton!
    @IBOutlet weak var grid2Btn: UIButton!
    
    var grid = 1
    
    override func awakeFromNib() {
        
        print(grid)
        
        if grid == 0{
            grid4Btn.setImage(#imageLiteral(resourceName: "4GridX"), for: .normal)
            grid2Btn.setImage(#imageLiteral(resourceName: "2GridColor"), for: .normal)
            
        }
        else{
            
            grid4Btn.setImage(#imageLiteral(resourceName: "4GridColor"), for: .normal)
            grid2Btn.setImage(#imageLiteral(resourceName: "2GridX"), for: .normal)
            
        }
        
    }
    

    
    
}
