//
//  UserDefaults+Codable.swift
//  GVKit
//
//  Created by Gustavo Vergara Garcia on 26/03/19.
//

import Foundation

public extension UserDefaults {
    
    func decodable<D: Decodable>(_ decodable: D.Type, forKey key: String, using decoder: JSONDecoder = JSONDecoder()) throws -> D? {
        guard let rawData = self.data(forKey: key) else { return nil }
        return try decoder.decode(decodable, from: rawData)
    }
    
    func setEncodable<E: Encodable>(_ value: E?, forKey key: String, using encoder: JSONEncoder = JSONEncoder()) throws {
        self.setValue(try value.map(encoder.encode), forKey: key)
    }
    
}
