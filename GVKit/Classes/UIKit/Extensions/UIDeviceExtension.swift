//
//  UIDeviceExtension.swift
//  MobfiqModels
//
//  Created by Gustavo Vergara Garcia on 03/01/18.
//  Copyright © 2018 Mobfiq. All rights reserved.
//

import UIKit

public extension UIDevice {
    
    var modelType: DeviceModel? {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        return DeviceModel(stringValue: identifier)
    }
    
    var stringID: String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
    
}

public enum DeviceModel {
    
    public init?(stringValue: String) {
        switch stringValue {
        case "iPod5,1":                                 self = .iPodTouch5
        case "iPod7,1":                                 self = .iPodTouch6
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     self = .iPhone4
        case "iPhone4,1":                               self = .iPhone4s
        case "iPhone5,1", "iPhone5,2":                  self = .iPhone5
        case "iPhone5,3", "iPhone5,4":                  self = .iPhone5c
        case "iPhone6,1", "iPhone6,2":                  self = .iPhone5s
        case "iPhone7,2":                               self = .iPhone6
        case "iPhone7,1":                               self = .iPhone6Plus
        case "iPhone8,1":                               self = .iPhone6s
        case "iPhone8,2":                               self = .iPhone6sPlus
        case "iPhone9,1", "iPhone9,3":                  self = .iPhone7
        case "iPhone9,2", "iPhone9,4":                  self = .iPhone7Plus
        case "iPhone8,4":                               self = .iPhoneSE
        case "iPhone10,1", "iPhone10,4":                self = .iPhone8
        case "iPhone10,2", "iPhone10,5":                self = .iPhone8Plus
        case "iPhone10,3", "iPhone10,6":                self = .iPhoneX
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":self = .iPad2
        case "iPad3,1", "iPad3,2", "iPad3,3":           self = .iPad3
        case "iPad3,4", "iPad3,5", "iPad3,6":           self = .iPad4
        case "iPad4,1", "iPad4,2", "iPad4,3":           self = .iPadAir
        case "iPad5,3", "iPad5,4":                      self = .iPadAir2
        case "iPad2,5", "iPad2,6", "iPad2,7":           self = .iPadMini
        case "iPad4,4", "iPad4,5", "iPad4,6":           self = .iPadMini2
        case "iPad4,7", "iPad4,8", "iPad4,9":           self = .iPadMini3
        case "iPad5,1", "iPad5,2":                      self = .iPadMini4
        case "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8":self = .iPadPro
        case "AppleTV5,3":                              self = .AppleTV
        case "i386", "x86_64":                          self = .Simulator
        default:                                        return nil
        }
    }
    
    case iPodTouch5
    case iPodTouch6
    case iPhone4
    case iPhone4s
    case iPhone5
    case iPhone5c
    case iPhone5s
    case iPhone6
    case iPhone6Plus
    case iPhone6s
    case iPhone6sPlus
    case iPhone7
    case iPhone7Plus
    case iPhoneSE
    case iPhone8
    case iPhone8Plus
    case iPhoneX
    case iPad2
    case iPad3
    case iPad4
    case iPadAir
    case iPadAir2
    case iPadMini
    case iPadMini2
    case iPadMini3
    case iPadMini4
    case iPadPro
    case AppleTV
    case Simulator
    
}
