//
//  NetworkActivityIndicatorPlugin.swift
//  GVKit
//

import Foundation
import Moya
import Result

public class NetworkActivityIndicatorPlugin: PluginType {
    
    public static let shared = NetworkActivityIndicatorPlugin(application: UIApplication.shared)
    
    public weak var application: UIApplication?
    
    private var count: Int = 0 {
        didSet {
            self.application?.isNetworkActivityIndicatorVisible = self.count > 0
        }
    }
    
    public init(application: UIApplication = UIApplication.shared) {
        self.application = application
    }
    
    /// Called immediately before a request is sent over the network (or stubbed).
    public func willSend(_ request: RequestType, target: TargetType) {
        DispatchQueue.main.async {
            self.count += 1
        }
    }
    
    /// Called after a response has been received, but before the MoyaProvider has invoked its completion handler.
    public func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        DispatchQueue.main.async {
            self.count -= 1
        }
    }
    
}
