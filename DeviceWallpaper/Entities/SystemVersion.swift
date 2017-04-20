//
//  OS.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/17.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIDevice

struct SystemVersion {
    var fullName: String
    var major: String
    var minor: String?
    var patch: String?

    init() {
        fullName = UIDevice.current.systemVersion

        let splittedName = fullName.components(separatedBy: ".")
        major = splittedName[0]
        minor = splittedName.count > 1 ? splittedName[1]: nil
        patch = splittedName.count > 2 ? splittedName[2]: nil
    }
}
