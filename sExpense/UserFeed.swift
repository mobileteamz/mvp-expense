//
//  UserFeed.swift
//  sExpense
//
//  Created by Nacho on 10/31/18.
//  Copyright © 2018 Nacho. All rights reserved.
//

import UIKit
import SwiftyJSON

class UsuarioSistema {
    var name : String?
    
    convenience init(json: JSON) {
        self.init()
        name = json[Constants.name].stringValue
    }
}

class UserFeed {
    
    var userList = [UsuarioSistema]()
    
    static func create(json: JSON) -> UserFeed {
        
        let result = UserFeed()
        
        for usr in json["docs"].array! {
            let user = UsuarioSistema.init(json:usr)
            result.userList.append(user)
        }
        
        return result
    }

}
