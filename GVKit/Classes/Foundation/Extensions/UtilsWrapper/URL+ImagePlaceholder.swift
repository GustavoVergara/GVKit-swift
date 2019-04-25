//
//  URL+ImagePlaceholder.swift
//  GVKit
//

import Foundation

extension URL: UtilsCompatible {}
public extension Utils where Base == URL {
    
    static func imagePlaceholder(ofSize size: CGSize, scale: CGFloat = UIScreen.main.scale, format: ImageFormat = .png, text: String? = nil) -> URL {
        var urlString = "https://via.placeholder.com/\(Int(size.width * scale))x\(Int(size.height * scale))\(format.extension)"
        
        if let text = text?.trimmingCharacters(in: CharacterSet.urlQueryAllowed.inverted) {
            urlString += "?text=\(text)"
        }
        
        return URL(string: urlString)!
    }
    
    enum ImageFormat {
        case gif
        case jpg
        case jpeg
        case png
        
        var `extension`: String {
            switch self {
            case .gif:  return ".gif"
            case .jpg:  return ".jpg"
            case .jpeg: return ".jpeg"
            case .png:  return ".png"
            }
        }
    }

}
