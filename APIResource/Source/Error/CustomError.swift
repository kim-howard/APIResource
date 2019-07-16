//
//  CustomError.swift
//  APIResource
//
//  Created by Hyeontae on 15/07/2019.
//

import Foundation

protocol CustomError: Error {
    var message: String { get }
    func log()
}
