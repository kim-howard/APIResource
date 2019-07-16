//
//  ResourceEnum.swift
//  APIResource
//
//  Created by Hyeontae on 15/07/2019.
//

import Foundation

public protocol ResourceBase {
    
    // MARK: - COMMON
    var method: HTTPMethod { get }
    var header: [String: String]? { get }
    var body: [String: Any]? { get }
    
    // MARK: - API Base
    
    // urlString  ||  host + path + (query || queryString)
    // NOT BOTH
    
    ///
    var urlString: String? { get }
    
    ///
    var host: String? { get }               // https://helloworld.com
    var path: String? { get }               // "/path/123" or "path/123"
    var queryString: String? { get }        // ?abc=def&swift=xcode
    var query: [String: String]? { get }    // [ abc: def, swift: xcode ]
    
}

public extension ResourceBase {
    
    var apiResource: APIResource {
        if let urlString = self.urlString {
            return APIResource(urlString)
        }

        do {
            return try APIResource(self)
        } catch {
            if let error = error as? CustomError {
                error.log()
            }
            fatalError("Cannot Create APIResource With ResourceBase Please Check")
        }
    }
    
    var urlRequest: URLRequest {
        return self.apiResource.urlRequest()
    }
    
    // MARK: - Optional Property
    
    var host: String? {
        return nil
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var urlString: String? {
        return nil
    }
    
    var header: [String: String]? {
        return nil
    }
    
    var path: String? {
        return nil
    }
    
    var queryString: String? {
        return nil
    }
    
    var query: [String: String]? {
        return nil
    }
    
    var body: [String: Any]? {
        return nil
    }
    

}


