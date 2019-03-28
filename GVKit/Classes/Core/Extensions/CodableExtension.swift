//
//  JSONDecoderExtension.swift
//  GVKit
//

import Foundation

public extension JSONDecoder {
    
    convenience init(
        dateDecodingStrategy: DateDecodingStrategy = .deferredToDate,
        dataDecodingStrategy: DataDecodingStrategy = .base64,
        nonConformingFloatDecodingStrategy: NonConformingFloatDecodingStrategy = .throw,
        userInfo: [CodingUserInfoKey : Any] = [:]
    ) {
        self.init()
        self.dateDecodingStrategy = dateDecodingStrategy
        self.dataDecodingStrategy = dataDecodingStrategy
        self.nonConformingFloatDecodingStrategy = nonConformingFloatDecodingStrategy
        self.userInfo = userInfo
    }
    
}

public extension JSONEncoder {
    
    convenience init(
        dateEncodingStrategy: DateEncodingStrategy = .deferredToDate,
        dataEncodingStrategy: DataEncodingStrategy = .base64,
        nonConformingFloatDecodingStrategy: NonConformingFloatEncodingStrategy = .throw,
        userInfo: [CodingUserInfoKey : Any] = [:]
    ) {
        self.init()
        self.dateEncodingStrategy = dateEncodingStrategy
        self.dataEncodingStrategy = dataEncodingStrategy
        self.nonConformingFloatEncodingStrategy = nonConformingFloatDecodingStrategy
        self.userInfo = userInfo
    }
    
}

public extension Decodable {
    
    init(fromDictionary dictionary: [String: Any], using decoder: JSONDecoder = JSONDecoder()) throws {
        self = try decoder.decode(Self.self, from: JSONSerialization.data(withJSONObject: dictionary))
    }
    
}

public extension Encodable {
    
    func toDictionary(using encoder: JSONEncoder = JSONEncoder()) throws -> [String: Any] {
        let encodedData = try encoder.encode(self)
        let jsonObject = try JSONSerialization.jsonObject(with: encodedData)
        
        return (jsonObject as? [String: Any]) ?? [:]
    }
    
}

public extension JSONDecoder.DateDecodingStrategy {
    
    @available(iOS 10.0, *)
    static func iso8601(formatOptions: ISO8601DateFormatter.Options) -> JSONDecoder.DateDecodingStrategy {
        return .custom({ (decoder) -> Date in
            let singleValueContainer = try decoder.singleValueContainer()
            let dateString = try singleValueContainer.decode(String.self)
            
            let isoFormatter = ISO8601DateFormatter()
            isoFormatter.formatOptions = formatOptions
            
            guard let date = isoFormatter.date(from: dateString) else { throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath, debugDescription: "Not able to parse date")) }
            return date
        })
    }
    
}
