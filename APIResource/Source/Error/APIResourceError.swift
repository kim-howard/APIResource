//
//  APIResourceError.swift
//  APIResource
//
//  Created by Hyeontae on 08/07/2019.
//  Copyright © 2019 onemoonStudio. All rights reserved.
//

import Foundation

/// ERROR what you encountered WHEN you manage APIResource
enum APIResourceError: CustomError {
    
    // MARK : - Init With URLString
    
    case urlStringComponent
    case urlSchemeisMissing
    case urlComponentHost
    case urlStringToURL(scheme: String, host: String)
    
    // MARK : - Init With ResourceBase
    
    case resourceHostisMissing
    case queryIsDuplicated
    
    // MARK: - Log control
    
    var message: String {
        switch self {
        case .urlStringComponent:
            return "Cannot Create URLComponent with your 'urlString' please check"
        case .urlSchemeisMissing:
            return "urlString should contain 'scheme' > http:// or https://"
        case .urlComponentHost:
            return "Your URLComponent.host is nil please Check "
        case .urlStringToURL(let scheme, let host):
            return "Cannot Create URL with \(scheme) + :// + \(host) \n please check"
        case .resourceHostisMissing:
            return "If you want to get APIResource with resourceBase not urlString \n host is inevitable"
        case .queryIsDuplicated:
            return "If you want to get APIResource with resourceBase not urlString \n APIResource needs query or queryString NOT BOTH"
        }
    }
    
    func log() {
        
        let errorMessage =
        """
        ::: APIResource Error Log :::
        \(self.message)
        ::: Error localizedDescription :::
        \(self.localizedDescription)
        """
        
        print(errorMessage)
    }
}
