//
//  PostmanModel.swift
//  APIResource_Example
//
//  Created by Hyeontae on 15/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

public struct GetModel: Codable {
    public let args: GetModel.Test
    public let url: String
    
    public struct Test: Codable {
        public let foo1: String
        public let foo2: String
    }
}
