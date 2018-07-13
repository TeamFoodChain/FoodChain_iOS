//
//  LoginNM.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 12..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class LoginNM : NetworkDelegate{
    
    
    func kakaoidcheck(kakaoid :String,  completion: @escaping (Join) -> Void){
        
        let url = "\(baseURL)/users/signup/check/id"
        
        let parameter = [
            "id" : kakaoid
        ]
        
       Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result{
            case .success:
                
                if let data = response.data {
                    do {
                        print(response.response?.statusCode)
                        print(JSON(data)["message"])
                        let Kakaocheck = try JSONDecoder().decode(Join.self, from: data)
                        completion(Kakaocheck)
                    } catch let error {
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
    func kakaologin(kakaoid :String,  completion: @escaping (Join) -> Void){
        
        let url = "\(baseURL)/users/signin/kakao"
        
        let parameter = [
            "id" : kakaoid
        ]
        
        Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result{
            case .success:
                
                if let data = response.data {
                    do {
                        print(response.response?.statusCode)
                        print(JSON(data)["message"])
                        let KakaoLogin = try JSONDecoder().decode(Join.self, from: data)
                        completion(KakaoLogin)
                    } catch let error {
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
    func nativelogin(nativeid :String, password: String, completion: @escaping (Join) -> Void){
        
        let url = "\(baseURL)/users/signin/native"
        
        let parameter = [
            "user_id" : nativeid,
            "user_pw" : password
        ]
        
        Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result{
            case .success:
                
                if let data = response.data {
                    do {
                        print(response.response?.statusCode)
                        print(JSON(data)["message"])
                        let nativeLogin = try JSONDecoder().decode(Join.self, from: data)
                        completion(nativeLogin)
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
