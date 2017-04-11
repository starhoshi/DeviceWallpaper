//
//  CategoriesType.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/11.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation

enum CategoriesType: Int {
    case normal
    case detail
    case simple
}

extension CategoriesType {
    public static let count: Int = {
        var i = 0
        while CategoriesType(rawValue: i) != nil {
            i += 1
        }
        return i
    }()
}

extension CategoriesType {
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
