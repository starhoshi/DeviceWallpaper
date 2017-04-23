//
//  DeviceType+Ex.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/23.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import Device

extension Type {
    var appleDeviceAPIPath: String {
        return self.rawValue.lowercased()
    }
}
