//
//  LocateNM.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 13..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class LocateNM : NetworkDelegate{
    
    
    
    
    func locatesend(add:String,lat:String,long:String,  completion: @escaping (Join) -> Void){
        
        let url = "\(baseURL)/users/locate"
        
        let parameter = [
            "locate_addr" : add,
            "locate_lat": lat,
            "locate_long":long
        ]
        let headers: HTTPHeaders = [
            "token": gsno(UserDefaults.standard.string(forKey: "usertoken"))
            
        ]
        
        Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: headers ).responseJSON { response in
            switch response.result{
            case .success:
                
                if let data = response.data {
                    do {
                        print(response.response?.statusCode)
                        print(JSON(data)["message"])
                        let locate = try JSONDecoder().decode(Join.self, from: data)
                        completion(locate)
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
