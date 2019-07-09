//
//  HTTPMethod.swift
//  APIResource
//
//  Created by Hyeontae on 08/07/2019.
//  Copyright © 2019 onemoonStudio. All rights reserved.
//

import Foundation

/// HTTP Method Enum
///
/// See https://tools.ietf.org/html/rfc7231#section-4.3
/// Reference https://github.com/Alamofire/Alamofire/blob/master/Source/HTTPMethod.swift
public enum HTTPMethod: String {
    /// `CONNECT` method.
    case connect = "CONNECT"
    /// `DELETE` method.
    case delete  = "DELETE"
    /// `GET` method.
    case get     = "GET"
    /// `HEAD` method.
    case head    = "HEAD"
    /// `OPTIONS` method.
    case options = "OPTIONS"
    /// `PATCH` method.
    case patch   = "PATCH"
    /// `POST` method.
    case post    = "POST"
    /// `PUT` method.
    case put     = "PUT"
    /// `TRACE` method.
    case trace   = "TRACE"

}
