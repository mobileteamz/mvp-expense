//
//  Session.swift
//  sExpense
//
//  Created by Nacho on 10/31/18.
//  Copyright © 2018 Nacho. All rights reserved.
//

import UIKit

class Session : NSObject {
    
    static let shared = Session()
    var user : User?
    var userFeed : UserFeed?
    
    override init() {
        super.init()     
    }
    
    func saveUser(_ user : User) {
        self.user = user
    }
    
    func saveUserList(_ userFeed : UserFeed) {
        self.userFeed = userFeed
    }
    
    func getUserFeed() -> [String] {
        var usersStr = [String]()
        for usr in (userFeed?.userList)! {
            usersStr.append(usr.name!)
        }
        return usersStr
    }

}
