//
//  APIResource.swift
//  APIResource
//
//  Created by Hyeontae on 08/07/2019.
//  Copyright © 2019 onemoonStudio. All rights reserved.
//

import Foundation

// TODO: PORT , url (computed property)

/// With APIResource you can manage basic url
public struct APIResource {
    
    // MARK: - Property
    
    public var method: HTTPMethod = .get
    public var baseURL: URL
    public var path: String?
    public var query: [String: String]?
    public var body: [String: Any]?
    public var headers: [String: String]?
    
    // MARK: - Initializer
    
    /// Initializer with urlString
    /// urlStrig in APIResource is whole string about URL
    /// FE) http://hello.world.com/path/deep?abc=def
    ///
    /// - Parameter urlString: simple String
    public init(_ urlString: String) {
        do {
            guard let component = URLComponents(string: urlString) else {
                throw APIResourceError.urlStringComponent
            }
            
            guard let componentScheme = component.scheme else {
                throw APIResourceError.urlSchemeisMissing
            }
            
            guard let componentHost = component.host else {
                throw APIResourceError.urlComponentHost
            }
            
            guard let baseURL = URL(string: componentScheme + "://" + componentHost) else {
                throw APIResourceError.urlStringToURL(scheme: componentScheme, host: componentHost)
            }
            
            self.baseURL = baseURL
            self.path = component.path
            if let componentQueryItems = component.queryItems, !componentQueryItems.isEmpty {
                var tempQuery: [String: String] = [:]
                for item in componentQueryItems {
                    tempQuery[item.name] = item.value!
                }
                self.query = tempQuery
            }
        } catch (let err as APIResourceError) {
            err.log()
            fatalError()
        } catch {
            print(error.localizedDescription)
            fatalError()
        }
    }
    
    /// Initializer with ResourceBase
    ///
    /// - Parameter resource: ResourceBase
    /// - Throws: APIResourceError When Create APIResource
    public init(_ resource: ResourceBase) throws {
        
        guard let host = resource.host else {
            throw APIResourceError.resourceHostisMissing
        }
        
        self.baseURL = URL(string: host)!
        
        if let path = resource.path {
            self.path = path
        }
        
        if resource.query != nil && resource.queryString != nil {
            throw APIResourceError.queryIsDuplicated
        }
        
        if let queryString = resource.queryString {
            self.query = queryItem(with: queryString)
        } else if let query = resource.query {
            self.query = query
        }
        
        if let body = resource.body {
            self.body = body
        }
        
        if let headers = resource.header {
            self.headers = headers
        }
    }
    
    // MARK: - Method
    
    /// Change query String to Query Item
    /// String -> [String: String]?
    ///
    /// - Parameter queryString: target queryString
    /// - Returns: query Item
    private func queryItem(with queryString: String) -> [String: String]? {
        var query: [String: String] = [:]
        let items = queryString.split(separator: "?")[0].split(separator: "&")
        
        if items.isEmpty {
            return nil
        }
        
        for item in items {
            let keyValue = item.split(separator: "=")
            query.updateValue(String(keyValue[1]), forKey: String(keyValue[0]))
        }
        
        return query
    }
    
    public mutating func method(_ method: HTTPMethod) -> APIResource {
        self.method = method
        return self
    }
    
    /// build URLRequest with APIResource
    ///
    /// - Returns: URLRequest
    public func urlRequest() -> URLRequest {
        return try! RequestBuilder(self).build()
    }
    
    /// build URLRequest with APIResource
    /// you can configure URLRequest cachePolicy and timeout with this method
    ///
    /// - Returns: URLRequest
    public func urlRequest(_ cachePolicy: URLRequest.CachePolicy?, _ timeout: TimeInterval?) -> URLRequest {
        return try! RequestBuilder(self, cachePolicy, timeout).build()
    }

    /// get data simply with this function
    /// without CachePolicy & timeout
    ///
    /// - Parameter completion: simple data
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
