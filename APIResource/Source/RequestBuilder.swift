//
//  RequestBuilder.swift
//  APIResource
//
//  Created by Hyeontae on 08/07/2019.
//  Copyright © 2019 onemoonStudio. All rights reserved.
//

import Foundation

/// Builder Pattern
/// cachePolicy and timeoutInterval are default value
public class RequestBuilder {
    
    // MARK: - Property
    
    public var apiResource: APIResource
    public var cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy
    public var timeoutInterval: TimeInterval = TimeInterval(60.0)
    
    // MARK: - Initializer
    
    /// Initializer with APIResource
    ///
    /// - Parameter apiResource: APIResource
    public init(_ apiResource: APIResource) {
        self.apiResource = apiResource
    }
    
    /// Initializer with APIResource
    /// you can configure URLRequest cachePolicy and timeout with this Initilizer
    ///
    /// - Parameters:
    ///   - apiResource: APIResource
    ///   - cachePolicy: URLRequest.CachePolicy
    ///   - timeout: URLRequest timeoutInterval
    public init(_ apiResource: APIResource, _ cachePolicy: URLRequest.CachePolicy?, _ timeout: TimeInterval?) {
        self.apiResource = apiResource
        
        if let newCachePolicy = cachePolicy {
            self.cachePolicy = newCachePolicy
        }
        
        if let newTimeoutInterval = timeout {
            self.timeoutInterval = newTimeoutInterval
        }
    }
    
    // MARK: - Method
    
    public func build() throws -> URLRequest {
        
        guard var urlComponents = URLComponents(url: apiResource.baseURL, resolvingAgainstBaseURL: true) else {
            throw RequestBuilderError.baseURLToComponent
        }
        
        if let path = apiResource.path {
            if path[path.startIndex] == "/" {
                urlComponents.path = path
            } else {
                urlComponents.path = "/" + path
            }
        }
        
        if let query = apiResource.query, !query.isEmpty {
            urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }
        
        guard let url = urlComponents.url else {
            throw RequestBuilderError.assembleURL(result: String(describing: urlComponents.url))
        }
        
        // last setup with headers and method
        return setupRequest(url, headers: apiResource.headers, method: apiResource.method)
    }
    
    /// setup headers and HTTP method
    ///
    /// - Parameters:
    ///   - url: URL with apiResource
    ///   - headers: HTTP header
    ///   - method: HTTP Method
    /// - Returns: result URLRequest
    private func setupRequest(_ url: URL, headers: [String: String]?, method: HTTPMethod) -> URLRequest {
        var resultRequest = URLRequest(url: url,
                                       cachePolicy: cachePolicy,
                                       timeoutInterval: timeoutInterval)
        if let headers = headers {
            for header in headers {
                resultRequest.addValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        resultRequest.httpMethod = apiResource.method.rawValue
        return resultRequest
    }
}
