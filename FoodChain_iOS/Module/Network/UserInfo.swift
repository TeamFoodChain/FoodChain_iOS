//
//  UserInfo.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 2..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation

struct UserInfo {
    var name: String
    var email: String
    var id: String
    var password: String
    var joinAddress: String
    
    init(name: String?, email: String?, id: String?, password: String?, joinAddress: String?){
        self.name = name!
        self.email = email!
        self.id = id!
        self.password = password!
        self.joinAddress = joinAddress!
        
    }
    
    init(){
        self.name = ""
        self.email = ""
        self.id = ""
        self.password  = ""
        self.joinAddress  = ""
        
    }
}
