//
//  DeviceVersion+Ex.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/17.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import Device

extension Version {
    var modelName: String {
        switch self {
        case .iPhone4:
            return "iPhone 4"
        case .iPhone4S:
            return "iPhone 4s"
        case .iPhone5:
            return "iPhone 5"
        case .iPhone5C:
            return "iPhone 5c"
        case .iPhone5S:
            return "iPhone 5s"
        case .iPhone6:
            return "iPhone 6"
        case .iPhone6Plus:
            return "iPhone 6 Plus"
        case .iPhone6S:
            return "iPhone 6s"
        case .iPhone6SPlus:
            return "iPhone 6s"
        case .iPhoneSE:
            return "iPhone SE"
        case .iPhone7:
            return "iPhone 7"
        case .iPhone7Plus:
            return "iPhone 7 Plus"
        case .iPad1:
            return "iPad 1st Generation"
        case .iPad2:
            return "iPad 2nd Generation"
        case .iPad3:
            return "iPad 3rd Generation"
        case .iPad4:
            return "iPad 4th Generation"
        case .iPad5:
            return "iPad 5th Generation"
        case .iPadAir:
            return "iPad Air"
        case .iPadAir2:
            return "iPad Air 2"
        case .iPadMini:
            return "iPad Mini 1st Generation"
        case .iPadMini2:
            return "iPad Mini 2"
        case .iPadMini3:
            return "iPad Mini 3"
        case .iPadMini4:
            return "iPad Mini 4"
        case .iPadPro9_7Inch:
            return "iPad Pro 9.7 inch"
        case .iPadPro12_9Inch:
            return "iPad Pro 12.9 inch"
        case .iPodTouch1Gen:
            return "iPod Touch 1st Generation"
        case .iPodTouch2Gen:
            return "iPod Touch 2nd Generation"
        case .iPodTouch3Gen:
            return "iPod Touch 3rd Generation"
        case .iPodTouch4Gen:
            return "iPod Touch 4th Generation"
        case .iPodTouch5Gen:
            return "iPod Touch 5th Generation"
        case .iPodTouch6Gen:
            return "iPod Touch 6th Generation"
        case .simulator:
            return "Simulator"
        case .unknown:
            return "Unknown"
        }
    }
}
