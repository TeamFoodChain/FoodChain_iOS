//
//  SHmarketTableViewCell.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 11..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class SHmarketTableViewCell: UITableViewCell {

    @IBOutlet weak var CV: UICollectionView!
    @IBOutlet weak var companyImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        CV.delegate = self
        CV.dataSource = self
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension SHmarketTableViewCell: UICollectionViewDelegateFlowLayout{
    
}

extension SHmarketTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "marketmenuCell", for: indexPath) as! SHmarketCollectionViewCell
        
        return cell
    }
    
}
