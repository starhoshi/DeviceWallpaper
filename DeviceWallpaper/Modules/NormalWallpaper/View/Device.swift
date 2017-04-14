//
//  Device.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/14.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIDevice

struct Device {
    var name: String
    var model: String
    var localizedModel: String
    var systemName: String
    var systemVersion: String
    var multiTaskEnabled: Bool

    init() {
        name = UIDevice.current.name
        model = UIDevice.current.model
        localizedModel = UIDevice.current.localizedModel
        systemName = UIDevice.current.systemName
        systemVersion = UIDevice.current.systemVersion
        multiTaskEnabled = UIDevice.current.isMultitaskingSupported
    }
}
