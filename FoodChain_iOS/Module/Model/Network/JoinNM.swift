//
//  JoinNM.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 11..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class JoinNM :NetworkDelegate{
    
    func nativeCustomerJoin(user_pw:String,user_name:String,user_email:String,user_phone:String, completion: @escaping (Join) -> Void) {
        let url = "\(baseURL)/users/signup/general"
        let parameters = [
            "user_pw" : user_pw,
            "user_name" : user_name,
            "user_email" : user_email,
            "user_phone" : user_phone
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
                switch response.result{
                case .success:
                    if let data = response.data {
                        do {
                            let join = try JSONDecoder().decode(Join.self, from: data)
                                completion(join)
                           
                        } catch let error {
                            print(error)
                        }
                    }
                case .failure(let error):
                    print(error)
            }
        }
        
    }
  
    func nativeOwnerJoin(sup_pw:String, sup_name:String, sup_email:String, sup_phone:String, sup_regist_num:String, mar_name:String, mar_locate_lat:String, mar_locate_long:String, mar_addr:String, completion: @escaping (Join) -> Void) {
        let url = "\(baseURL)/users/signup/supplier"
        
        let parameters = [
            "sup_name" : sup_name,
            "sup_email" : sup_email,
            "sup_phone": sup_phone,
            "sup_regist_num" : sup_regist_num ,
            "sup_pw" : sup_pw ,
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
                            let join = try JSONDecoder().decode(Join.self, from: data)
                            completion(join)
                        
                    } catch let error {
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func nativeKakaoCustomerJoin(user_pw_check:String,user_pw:String,user_name:String,user_email:String,user_phone:String,user_id:String, completion: @escaping (Join) -> Void) {
        let url = "\(baseURL)/users/signup/general"
        let parameters = [
            "user_pw" : user_pw,
            "user_name" : user_name,
            "user_email" : user_email,
            "user_phone" : user_phone,
            "user_id":user_id
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result{
            case .success:
                if let data = response.data {
                    do {
                        let join = try JSONDecoder().decode(Join.self, from: data)
                            completion(join)
                       
                    } catch let error {
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func nativeKakaoOwnerJoin(sup_pw:String, sup_name:String, sup_email:String, sup_phone:String, sup_regist_num:String, mar_name:String, mar_locate_lat:String, mar_locate_long:String, mar_addr:String,sup_id:String, completion: @escaping (Join) -> Void) {
        let url = "\(baseURL)/users/signup/supplier"
        
        let parameters = [
            "sup_name" : sup_name,
            "sup_email" : sup_email,
            "sup_phone": sup_phone,
            "sup_regist_num" : sup_regist_num ,
            "sup_pw" : sup_pw ,
            "mar_name" : mar_name,
            "mar_locate_lat" : mar_locate_lat,
            "mar_locate_long" : mar_locate_long,
            "mar_addr" : mar_addr,
            "sup_id":sup_id
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result{
            case .success:
                if let data = response.data {
                    do {
                        let join = try JSONDecoder().decode(Join.self, from: data)
                            completion(join)
                       
                    } catch let error {
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func emailcheck(email :String,  completion: @escaping (Join) -> Void){
        
        let url = "\(baseURL)/users/signup/check/email"
        
        let parameter = [
            "email" : email
        ]
        
        Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result{
            case .success:
                if let data = response.data {
                    do {
                        let emailchecking = try JSONDecoder().decode(Join.self, from: data)
                            completion(emailchecking)
                    } catch let error {
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
            
        }
        
        
        

    }
    
    func phonecheck(number :String,  completion: @escaping (Join) -> Void){
        
        let url = "\(baseURL)/users/signup/check/phone"
        
        let parameter = [
            "phone" : number
        ]
        
        Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result{
            case .success:
                print(response.response?.statusCode)
                if let data = response.data {
                    do {
                        print(JSON(data)["message"])
                        let phonechecking = try JSONDecoder().decode(Join.self, from: data)
                        completion(phonechecking)
                    } catch let error {
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
            
        }
        
        
        
        
    }
    
    func companynumcheck(companynumber :String,  completion: @escaping (Join) -> Void){
        
        let url = "\(baseURL)/users/signup/check/regist"
        
        let parameter = [
            "sup_regist_num" : companynumber
        ]
        
        Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result{
            case .success:
                print(response.response?.statusCode)
                if let data = response.data {
                    do {
                        print(JSON(data)["message"])
                        let phonechecking = try JSONDecoder().decode(Join.self, from: data)
                        completion(phonechecking)
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
    
    

