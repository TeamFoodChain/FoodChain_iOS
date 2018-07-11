//
//  LoginNM.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 12..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation


class LoginNM : NetworkDelegate{
    
    
    func nativeOwnerJoin(email:String,password:String, completion: @escaping (Join) -> Void) {
        let url = "\(baseURL)/users/signup/supplier"
        
        let parameters = [
            "sup_name" : sup_name,
            "sup_email" : sup_email,
            "sup_phone": sup_phone,
            "sup_regist_num" : sup_regist_num ,
            "sup_pw" : sup_pw ,
            "sup_pw_check" : sup_pw_check,
            "mar_name" : mar_name,
            "mar_locate_lat" : mar_locate_lat,
            "mar_locate_long" : mar_locate_long,
            "mar_addr" : mar_addr
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result{
            case .success:
                if let data = response.data {
                    do {
                        if JSON(data)["message"] == "success signup" {
                            let join = try JSONDecoder().decode(Join.self, from: data)
                            completion(join)
                        } else {
                            print(JSON(data)["message"])
                        }
                    } catch let error {
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}
