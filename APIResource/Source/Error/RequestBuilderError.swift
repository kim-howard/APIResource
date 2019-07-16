//
//  RequestBuilderError.swift
//  APIResource
//
//  Created by Hyeontae on 15/07/2019.
//

import Foundation

enum RequestBuilderError: CustomError {
    
    // MARK: - Build With APIResource
    
    case baseURLToComponent
    case assembleURL(result: String)
    
    // MARK: - Log control
    
    var message: String {
        switch self {
        case .baseURLToComponent:
            return "baseURL To URLComponent is failed"
        case .assembleURL(let resultURLComponent):
            return "result is Akward pleaseCheck \(resultURLComponent)"
        }
    }
    
    func log() {
        
        let errorMessage =
        """
        ::: APIResource RequestBuilder Error Log :::
        \(self.message)
        ::: Error localizedDescription :::
        \(self.localizedDescription)
        """
        
        print(errorMessage)
    }
}
