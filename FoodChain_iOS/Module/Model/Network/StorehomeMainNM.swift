//
//  Storehomemain.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 13..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire


class StorehomeMainNM: NetworkDelegate{
  
    
    func getmaindata(token:String ,completion: @escaping (SHmainObject) -> Void){
        
        let url = "\(baseURL)/home/main"
        
        let headers: HTTPHeaders = [
            "token": token
         ]
        
        Alamofire.request(url, method: .get, parameters:nil, encoding: JSONEncoding.default, headers: headers ).responseJSON { response in
            switch response.result{
            case .success:
                if let data = response.data {
                    do {
                        print(response.response?.statusCode)
                        print(JSON(data)["message"])
                        let main = try JSONDecoder().decode(SHmainObject.self, from: data)
                        completion(main)
                    } catch let error {
                        print("에러")
                        print(error)
                    }
                }
            case .failure(let error):
                print("에러")
                print(error)
            }
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
}
