//
//  SHtimesaleTableViewCell.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 10..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class SHtimesaleTableViewCell: UITableViewCell {

    @IBOutlet weak var waitLB: UIImageView!
    @IBOutlet weak var pickupLB: UILabel!
    @IBOutlet weak var timesaleImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

