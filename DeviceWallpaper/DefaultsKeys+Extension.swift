//
//  DefaultsKeys+Extension.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/11.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIColor
import SwiftyUserDefaults

extension DefaultsKeys {
    static let initialized = DefaultsKey<Bool>("initialized")
    static let colorTheme = DefaultsKey<UIColor>("colorTheme")
    
    
}

extension UserDefaults {
    subscript(key: DefaultsKey<UIColor>) -> UIColor {
        get { return unarchive(key)! }
        set { archive(key, newValue) }
    }
}

enum ColorTheme {
    case white
    case black
}
