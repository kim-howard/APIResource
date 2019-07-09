//
//  RequestBuilder.swift
//  APIResource
//
//  Created by Hyeontae on 08/07/2019.
//  Copyright © 2019 onemoonStudio. All rights reserved.
//

import Foundation

public class RequestBuilder {
    
    // MARK: - Property
    
    public var apiResource: APIResource
    public var cachePolicy: URLRequest.CachePolicy = .returnCacheDataElseLoad
    public var timeoutInterval: TimeInterval = TimeInterval(5.0)
    
    // MARK: - Initializer
    
    public init(_ apiResource: APIResource) {
        self.apiResource = apiResource
        
    }
    
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
    
    public func build() -> URLRequest {
        
        guard var urlComponents = URLComponents(string: apiResource.urlString) else {
            fatalError("components is not created")
        }
        
        // urlString 과 별개로 host를 변경하고 싶을 때
        if let host = apiResource.host {
            urlComponents.host = host
        }
        
        // urlString과 별개로 path 를 변경하고 싶을 때
        if let paths = apiResource.paths, !paths.isEmpty {
            let path = paths.joined(separator: "/")
            urlComponents.path += "/" + path
        }
        
        // urlString과 별개로 query 를 변경하고 싶을 때
        if let query = apiResource.query, !query.isEmpty {
            urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }
        
        guard let url = urlComponents.url else {
            fatalError("component url is akward : \(String(describing: urlComponents.url))")
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
    private func setupRequest(_ url: URL, headers: [String: Any]?, method: HTTPMethod) -> URLRequest {
        var resultRequest = URLRequest(url: url,
                                       cachePolicy: cachePolicy,
                                       timeoutInterval: timeoutInterval)
        if let headers = headers {
            for header in headers {
                resultRequest.addValue("\(header.value)", forHTTPHeaderField: header.key)
            }
        }
        resultRequest.httpMethod = apiResource.method.rawValue
        return resultRequest
    }
}
