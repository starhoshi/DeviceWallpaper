//
//  CategoriesType.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/11.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIColor

enum WallpaperType: Equatable {
    case simple(ColorTheme)
    case normal(ColorTheme)
    case detail(ColorTheme)
}

extension WallpaperType {
    public static func toArray() -> [WallpaperType] {
        return [
                .simple(.white),
                .simple(.black),
                .normal(.white),
                .normal(.black),
                .detail(.white),
                .detail(.black)
        ]
    }
}

func == (lhs: WallpaperType, rhs: WallpaperType) -> Bool {
    switch (lhs, rhs) {
    case (.simple(let lhsNext), .simple(let rhsNext)):
        return lhsNext == rhsNext
    case (.normal(let lhsNext), .normal(let rhsNext)):
        return lhsNext == rhsNext
    case (.detail(let lhsNext), .detail(let rhsNext)):
        return lhsNext == rhsNext
    default:
        return false
    }
}

extension WallpaperType {
    var title: String {
        switch self {
        case .simple(let colorTheme):
            return "Simple Wallpaper (\(colorTheme.title))"
        case .normal(let colorTheme):
            return "Normal Wallpaper (\(colorTheme.title))"
        case .detail(let colorTheme):
            return "Detail Wallpaper (\(colorTheme.title))"
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
