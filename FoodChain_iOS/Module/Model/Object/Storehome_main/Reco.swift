//
//  Reco.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 13..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation

struct Reco : Codable {
    let pro_idx : Int?
    let pro_name : String?
    let pro_price : Int?
    let pro_sale_price : Int?
    let pro_img : String?
   
    
    enum CodingKeys: String, CodingKey {
        
        case pro_idx  = "pro_idx "
        case pro_name = "pro_name"
        case pro_price = "pro_price"
        case pro_sale_price = "pro_sale_price"
        case pro_img = "pro_img"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        pro_idx = try values.decodeIfPresent(Int.self, forKey: .pro_idx)
        pro_name = try values.decodeIfPresent(String.self, forKey: .pro_name)
        pro_price = try values.decodeIfPresent(Int.self, forKey: .pro_price)
        pro_sale_price = try values.decodeIfPresent(Int.self, forKey: .pro_sale_price)
        pro_img = try values.decodeIfPresent(String.self, forKey: .pro_img)
       
    }
    
}
