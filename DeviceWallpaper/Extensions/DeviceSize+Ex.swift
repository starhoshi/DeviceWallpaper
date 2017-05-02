//
//  DeviceSize+Ex.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/05/02.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import Device

extension Size {
    var wallpaperSize: Int {
        switch self {
        case .screen3_5Inch:
            return 0
        case .screen4Inch:
            return 0
        case .screen4_7Inch:
            return 0
        case .screen5_5Inch:
            return 0
        case .screen7_9Inch:
            return 0
        case .screen9_7Inch:
            return 0
        case .screen12_9Inch:
            return 0
        case .unknownSize:
            return 0
        }
    }
}
