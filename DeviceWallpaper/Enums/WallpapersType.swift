//
//  CategoriesType.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/11.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation

enum WallpapersType: Int {
    case normal
    case detail
    case simple
}

extension WallpapersType {
    public static func toArray() -> [WallpapersType] {
        return [.normal, .detail, .simple]
    }
}

extension WallpapersType {
    var title: String {
        switch self {
        case .normal:
            return "Normal Wallpaper"
        case .detail:
            return "Detail Wallpaper"
        case .simple:
            return "Simple Wallpaper"
        }
    }
}
