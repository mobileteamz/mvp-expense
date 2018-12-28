//
//  SystemsWebRouter.swift
//  SystemsWeb
//
//  Created by Nacho on 04/09/2018.
//  Copyright © 2018 Landhsoft. All rights reserved.

import UIKit
import Alamofire

extension String {
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        return request
    }
}


public enum NetworkRouter : URLRequestConvertible {
    static let baseURLPath = "http://demo4369126.mockable.io"
    
    case login(String,String)
    case getUserList()
    
    
    var method: HTTPMethod {
        switch self {
        case .login(let username, let password):
            return .post
        case .getUserList(let token):
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "login"
        case .getUserList:
            return "getUserList"
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let array : [String] = {
            switch self {
            default:
                return []
            }
        }()
        
        
        let parameters: [String: Any] = {
            return [:]
        }()
        
        let url = URL.init(string: NetworkRouter.baseURLPath)
        
        var request = URLRequest(url: url!.appendingPathComponent(path))
        
        request.cachePolicy = .reloadIgnoringCacheData
        request.httpMethod = method.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        
        if self.method == .post || self.method == .put || self.method == .patch{
            request.httpBody = try! JSONSerialization.data(withJSONObject: parameters)
        }
        
        if self.method == .get {
            return try URLEncoding.queryString.encode(request, with: nil)
        }
        
        request.timeoutInterval = TimeInterval(10 * 1000)
        return try URLEncoding.default.encode(request, with: nil)
    }
}


