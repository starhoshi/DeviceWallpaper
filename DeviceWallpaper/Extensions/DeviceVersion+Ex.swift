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
            return "iPhone 6s Plus"
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

extension Version {
    var appleDeviceAPIPath: String {
        switch self {
        case .iPhone4:
            return "iphone_4"
        case .iPhone4S:
            return "iphone_4s"
        case .iPhone5:
            return "iphone_5"
        case .iPhone5C:
            return "iphone_5c"
        case .iPhone5S:
            return "iphone_5s"
        case .iPhone6:
            return "iphone_6"
        case .iPhone6Plus:
            return "iphone_6_plus"
        case .iPhone6S:
            return "iphone_6s"
        case .iPhone6SPlus:
            return "iphone_6s_plus"
        case .iPhoneSE:
            return "phone_se"
        case .iPhone7:
            return "iphone_7"
        case .iPhone7Plus:
            return "iphone_7_plus"
        case .iPad1:
            return "ipad_1"
        case .iPad2:
            return "ipad_2"
        case .iPad3:
            return "ipad_3"
        case .iPad4:
            return "ipad_4"
        case .iPad5:
            return "ipad_5"
        case .iPadAir:
            return "ipad_air"
        case .iPadAir2:
            return "ipad_air_2"
        case .iPadMini:
            return "ipad_mini_1"
        case .iPadMini2:
            return "ipad_mini_3"
        case .iPadMini3:
            return "ipad_mini_3"
        case .iPadMini4:
            return "ipad_mini_4"
        case .iPadPro9_7Inch:
            return "ipad_pro_9_7"
        case .iPadPro12_9Inch:
            return "ipad_pro_12_9"
        case .iPodTouch1Gen:
            return "ipod_touch_1"
        case .iPodTouch2Gen:
            return "ipod_touch_2"
        case .iPodTouch3Gen:
            return "ipod_touch_3"
        case .iPodTouch4Gen:
            return "ipod_touch_4"
        case .iPodTouch5Gen:
            return "ipod_touch_5"
        case .iPodTouch6Gen:
            return "ipod_touch_6"
        case .simulator:
            return "simulator"
        case .unknown:
            return "Unknown"
        }
    }
}
