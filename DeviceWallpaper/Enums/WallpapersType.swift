//
//  CategoriesType.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/11.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIColor

enum WallpapersType {
    case simple(ColorTheme)
    case normal(ColorTheme)
//    case detail
}

extension WallpapersType {
    public static func toArray() -> [WallpapersType] {
//        return [.simple, .normal, .detail]
        return [.simple(.white), .simple(.black), .normal(.white), .normal(.black)]
    }
}

extension WallpapersType {
    var title: String {
        switch self {
        case .simple(let colorTheme):
            return "Simple Wallpaper (\(colorTheme.title))"
        case .normal(let colorTheme):
            return "Normal Wallpaper (\(colorTheme.title))"
//        case .detail:
//            return "Detail Wallpaper"
        }
    }
}

enum ColorTheme {
    case black
    case white
}

extension ColorTheme {
    var title: String {
        switch self {
        case .black:
            return "Dark"
        case .white:
            return "Light"
        }
    }

    var gradiation: [CGColor] {
        switch self {
        case .black:
            return [UIColor.white.cgColor, UIColor.white.cgColor, UIColor.white.cgColor]
        case .white:
            return [UIColor.blue.cgColor, UIColor.cyan.cgColor, UIColor.green.cgColor]
        }
    }

    var fontColor: UIColor {
        switch self {
        case .black:
            return .white
        case .white:
            return .darkGray
        }
    }

    var backgroundColor: UIColor {
        switch self {
        case .black:
            return .darkGray
        case .white:
            return .white
        }
    }
}
