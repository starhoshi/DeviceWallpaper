//
//  CategoriesType.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/11.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation

enum WallpapersType: Int {
    case simple
    case normal
//    case detail
}

extension WallpapersType {
    public static func toArray() -> [WallpapersType] {
//        return [.simple, .normal, .detail]
        return [.simple, .normal]
    }
}

extension WallpapersType {
    var title: String {
        switch self {
        case .simple:
            return "Simple Wallpaper"
        case .normal:
            return "Normal Wallpaper"
//        case .detail:
//            return "Detail Wallpaper"
        }
    }
}
