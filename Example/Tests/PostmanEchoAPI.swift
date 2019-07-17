//
//  PostmanEchoAPI.swift
//  APIResource_Example
//
//  Created by Hyeontae on 15/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import APIResource

enum PostmanEchoAPI {
    case getRequest
}

extension PostmanEchoAPI: ResourceBase {
    
    var host: String? {
        switch self {
        case .getRequest:
            return "https://postman-echo.com/"
        }
    }
    
    var path: String? {
        switch self {
        case .getRequest:
            return "/get"
        }
    }
    
    var queryString: String? {
        switch self {
        case .getRequest:
            return "?foo1=bar1&foo2=bar2"
        }
    }
    
}
