//
//  CacheControlPlugin.swift
//  GVKit
//

import Foundation
import Moya
import Result

// TODO: Add customizable behaviors
public struct CacheControlPlugin: PluginType {
    
    public static let shared = CacheControlPlugin(urlCache: URLCache.shared)
    
    public var urlCache: URLCache
    
    public init(urlCache: URLCache) {
        self.urlCache = urlCache
    }
    
    /// Called to modify a result before completion.
    public func process(_ result: Result<Moya.Response, MoyaError>, target: TargetType) -> Result<Moya.Response, MoyaError> {
        guard case let .failure(moyaError) = result else {
            return result
        }
        
        switch moyaError {
        case .underlying(let error as NSError, let response) where error.domain == NSURLErrorDomain:
            let cachedURLResponse = response?.request.flatMap(self.urlCache.cachedResponse)
//                target.
            guard let cachedHTTPURLResponse = cachedURLResponse?.response as? HTTPURLResponse, let data = cachedURLResponse?.data else {
                return result
            }
            let cachedResponse = Moya.Response(statusCode: cachedHTTPURLResponse.statusCode, data: data, request: response?.request, response: cachedHTTPURLResponse)
            return Result.success(cachedResponse)
            
        default:
            return result
        }
    }

}
