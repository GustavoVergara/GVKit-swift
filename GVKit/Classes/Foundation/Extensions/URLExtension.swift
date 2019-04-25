//
//  URLExtension.swift
//  GVKit
//

// Code from https://github.com/SwifterSwift/SwifterSwift/blob/master/Sources/Extensions/Foundation/URLExtensions.swift
import Foundation
import CoreLocation

public extension URL {
    
    var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true), let queryItems = components.queryItems else {
            return nil
        }
        
        var parameters = [String: String]()
        for item in queryItems {
            parameters[item.name] = item.value
        }
        
        return parameters.isEmpty == false ? parameters : nil
    }
    
    /// SwifterSwift: URL with appending query parameters.
    ///
    ///        let url = URL(string: "https://google.com")!
    ///        let param = ["q": "Swifter Swift"]
    ///        url.appendingQueryParameters(params) -> "https://google.com?q=Swifter%20Swift"
    ///
    /// - Parameter parameters: parameters dictionary.
    /// - Returns: URL with appending given query parameters.
    func appendingQueryParameters(_ parameters: [String: String]) -> URL {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true)
        var items = urlComponents?.queryItems ?? []
        items += parameters.map({ URLQueryItem(name: $0, value: $1) })
        urlComponents?.queryItems = items
        return urlComponents?.url ?? self
    }
    
    /// SwifterSwift: Append query parameters to URL.
    ///
    ///        var url = URL(string: "https://google.com")!
    ///        let param = ["q": "Swifter Swift"]
    ///        url.appendQueryParameters(params)
    ///        print(url) // prints "https://google.com?q=Swifter%20Swift"
    ///
    /// - Parameter parameters: parameters dictionary.
    mutating func appendQueryParameters(_ parameters: [String: String]) {
        self = appendingQueryParameters(parameters)
    }

}

public extension URL {
    
    static var applicationSettings: URL { return URL(string: UIApplication.openSettingsURLString)! }
    
    static func googleMaps(startAddress: String, endAddress: String) -> URL {
        return URL(string: "comgooglemaps://?saddr=\(startAddress),&daddr=\(endAddress)")!
    }
    
    static func googleMaps(navigateTo coordinate: CLLocationCoordinate2D) -> URL {
        return .googleMaps(startAddress: "Current+Location", endAddress: "\(coordinate.latitude),\(coordinate.longitude)")
    }
    
    static func waze(navigateTo coordinate: CLLocationCoordinate2D) -> URL {
        return URL(string: "waze://?ll=\(coordinate.latitude),\(coordinate.longitude)&navigate=yes")!
    }
    
}
