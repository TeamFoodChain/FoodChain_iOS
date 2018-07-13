//
//  File.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 13..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation

struct Coupon : Codable {
    let coupon_name : String?
    let coupon_sale_info : String?
    let coupon_ex_date : String?
    
    
    enum CodingKeys: String, CodingKey {
        
        case coupon_name = "coupon_name"
        case coupon_sale_info = "coupon_sale_info"
        case coupon_ex_date = "coupon_ex_date"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        coupon_name = try values.decodeIfPresent(String.self, forKey: .coupon_name)
        coupon_sale_info = try values.decodeIfPresent(String.self, forKey: .coupon_sale_info)
        coupon_ex_date = try values.decodeIfPresent(String.self, forKey: .coupon_ex_date)
        
    }
    
}
