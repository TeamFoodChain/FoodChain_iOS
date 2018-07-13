//
//  SHhomeTableViewCell.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 6..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class SHhomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productname: UILabel!
    @IBOutlet weak var discountper: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var oriprice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
