//
//  DeviceSize+Ex.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/05/02.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import Device

// iOS Quick Reference for iPhone, iPad, and Apple Watch http://iosres.com/
extension Size {
    var wallpaperSize: (width: Int, height: Int) {
        switch self {
        case .screen3_5Inch:
            return (width: 370, height: 596)
        case .screen4Inch:
            return (width: 372, height: 696)
        case .screen4_7Inch:
            return (width: 426, height: 804)
        case .screen5_5Inch:
            return (width: 888, height: 888)
        case .screen7_9Inch:
            return (width: 631, height: 631)
        case .screen9_7Inch:
            return (width: 1271, height: 1271)
        case .screen12_9Inch:
            return (width: 1366, height: 1366)
        case .unknownSize:
            return (width: 1000, height: 1000)
        }
    }

    var screenSize: (width: Int, height: Int) {
        switch self {
        case .screen3_5Inch:
            return (width: 320, height: 480)
        case .screen4Inch:
            return (width: 320, height: 568)
        case .screen4_7Inch:
            return (width: 375, height: 667)
        case .screen5_5Inch:
            return (width: 414, height: 736)
        case .screen7_9Inch:
            return (width: 768, height: 1024)
        case .screen9_7Inch:
            return (width: 768, height: 1024)
        case .screen12_9Inch:
            return (width: 1024, height: 1366)
        case .unknownSize:
            return (width: 800, height: 800)
        }
    }
}
