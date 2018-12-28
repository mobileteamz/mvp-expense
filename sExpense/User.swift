//
//  User.swift
//  sExpense
//
//  Created by Nacho on 10/30/18.
//  Copyright © 2018 Nacho. All rights reserved.
//

import UIKit
import SwiftyJSON

class User {
    var username : String?
    var name : String?
    var lastname : String?
    var email : String?
    var birthdate : String?
    
    convenience init(json: JSON) {
        self.init()
        username = json[Constants.username].stringValue
        name = json[Constants.name].stringValue
        lastname = json[Constants.lastname].stringValue
        email = json[Constants.email].stringValue
        birthdate = json[Constants.birthdate].stringValue
    }
}
