//
//  UserDefaults+Codable.swift
//  GVKit
//
//  Created by Gustavo Vergara Garcia on 26/03/19.
//

import Foundation

public extension UserDefaults {
    
    func decodable<D: Decodable>(_ decodable: D.Type, forKey key: String, using decoder: JSONDecoder = JSONDecoder()) -> D? {
        guard let rawData = self.data(forKey: key) else { return nil }
        
        return try? decoder.decode(decodable, from: rawData)
    }
    
    func set<E: Encodable>(encodable value: E?, forKey key: String, using encoder: JSONEncoder = JSONEncoder()) {
        guard let value = value else {
            self.setValue(nil, forKey: key)
            return
        }
        
        self.setValue(try? encoder.encode(value), forKey: key)
    }
    
}
