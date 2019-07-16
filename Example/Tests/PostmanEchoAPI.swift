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
    case get
    case post
}

extension PostmanEchoAPI: ResourceBase {
    
    var urlString: String? {
        switch self {
        case .get:
            return "https://postman-echo.com/get?foo1=bar1&foo2=bar2"
        default:
            return nil
        }
    }
    
}
