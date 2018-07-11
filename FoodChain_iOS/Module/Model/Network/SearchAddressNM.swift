//
//  SearchAddressNM.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 11..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class SearchAddressNM:NetworkDelegate{
    
    func searchAD(keyword:String, completion: @escaping (SearchAddress) -> Void) {
        let url = "http://www.juso.go.kr/addrlink/addrLinkApi.do"
        
        let parameters :[String:Any] = [
            "confmKey" : jusokey,
            "currentPage" : 1,
            "countPerPage" : 100,
            "keyword" : keyword,
            "resultType" : "json"
        ]
        
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { response in
            switch response.result{
            case .success:
                if let data = response.data {
                    do {
                        print(JSON(data))
                        let searchAd = try JSONDecoder().decode(SearchAddress.self, from: data)
                        completion(searchAd)
                       
                    } catch let error {
                        
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    func geoconding(keyword:String, completion: @escaping (Geocoding) -> Void) {
        let url = "https://maps.googleapis.com/maps/api/geocode/json"
        
        let parameters = [
            "address" : keyword,
            "key" : googlekey
        ]
        
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { response in
            switch response.result{
            case .success:
                if let data = response.data {
                    do {
                        if JSON(data)["status"] == "OK"{
                            print("성공")
                        let geocode = try JSONDecoder().decode(Geocoding.self, from: data)
                        completion(geocode)
                        }else{
                            print("실패")
                            
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
