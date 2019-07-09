//
//  APIResource.swift
//  APIResource
//
//  Created by Hyeontae on 08/07/2019.
//  Copyright © 2019 onemoonStudio. All rights reserved.
//

import Foundation

/// use this structure if you want to request
public struct APIResource {
    
    // MARK: - Property
    
    var urlString: String
    var method: HTTPMethod = .get
    var url: URL?
    var host: String?
    var paths: [String]?
    var query: [String: Any]?
    var body: [String: Any]?
    var headers: [String: Any]?
    
    // MARK: - Initializer
    
    public init(_ urlString: String) {
        self.urlString = urlString
    }
    
    // MARK: - Method
    
    public mutating func method(_ method: HTTPMethod) -> APIResource {
        self.method = method
        return self
    }
    
    public func urlRequest() -> URLRequest {
        return RequestBuilder(self).build()
    }
    
    public func urlRequest(_ cachePolicy: URLRequest.CachePolicy?, _ timeout: TimeInterval?) -> URLRequest {
        return RequestBuilder(self, cachePolicy, timeout).build()
    }
    
    /// simply get data with this function
    public func get(completion: @escaping (_ data: Data?) -> Void) {
        let urlSession = URLSession(configuration: .default)
        
        urlSession.dataTask(with: self.urlRequest()) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            
            if let httpURLResponse = response as? HTTPURLResponse {
                print("Success to get data with response statusCode \(httpURLResponse.statusCode)")
            }
            
            completion(data)
            }.resume()
        
    }
}
