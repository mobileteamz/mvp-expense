//
//  NetworkService.swift
//  SystemsWeb
//
//  Created by Nacho on 09/09/2018.
//  Copyright © 2018 Landhsoft. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkService: NSObject {
    
    open class func performRequest(router : NetworkRouter, values : [String:String], completion: @escaping (JSON?, Error?) -> Void) {        
        
        Alamofire.request(router).responseJSON { response in
            if response.response?.statusCode == 200 {
                let value = response.result.value
                let json = JSON(value as Any)
                completion(json, nil)
            } else if response.response?.statusCode == 400 {
                let error = response.result.error
                completion(nil, error)
            } else if response.response?.statusCode == 503 {
                let error = response.result.error
                completion(nil, nil)
            } else {
                let error = response.result.error
                completion(nil, error)
            }
        }
    }
}

