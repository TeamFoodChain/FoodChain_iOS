//
//  ChoiceNM.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 13..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class ChoiceNM : NetworkDelegate{
    
    func favoritechoice(pro_cate: [String],  completion: @escaping (Join) -> Void){
        
        let url = "\(baseURL)/users/choice/set"
        
        let parameter = [
            "pro_cate" : pro_cate
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
                        let choice = try JSONDecoder().decode(Join.self, from: data)
                        completion(choice)
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
