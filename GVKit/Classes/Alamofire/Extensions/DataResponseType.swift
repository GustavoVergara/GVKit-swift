//
//  Alamofire+DataResponseType.swift
//  GVKit
//

import Foundation
import Alamofire

protocol DataResponseType {
    associatedtype Value
    
    var result: Result<Value> { get }
    var value: Value? { get }
    var error: Error? { get }
}
extension DataResponse: DataResponseType {}
