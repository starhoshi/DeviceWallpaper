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
    var os: String
    var hardware: String
    var releaseLevel: String
    var versionLevel: String

    init() {
        name = UIDevice.current.name
        model = UIDevice.current.model
        localizedModel = UIDevice.current.localizedModel
        systemName = UIDevice.current.systemName
        systemVersion = UIDevice.current.systemVersion
        multiTaskEnabled = UIDevice.current.isMultitaskingSupported

        var systemInfo = utsname()
        uname(&systemInfo)

        os = String(validatingUTF8: NSString(bytes: &systemInfo.sysname, length: Int(_SYS_NAMELEN), encoding: String.Encoding.ascii.rawValue)!.utf8String!)!

        releaseLevel = String(validatingUTF8: NSString(bytes: &systemInfo.release, length: Int(_SYS_NAMELEN), encoding: String.Encoding.ascii.rawValue)!.utf8String!)!

        versionLevel = String(validatingUTF8: NSString(bytes: &systemInfo.version, length: Int(_SYS_NAMELEN), encoding: String.Encoding.ascii.rawValue)!.utf8String!)!

        hardware = String(validatingUTF8: NSString(bytes: &systemInfo.machine, length: Int(_SYS_NAMELEN), encoding: String.Encoding.ascii.rawValue)!.utf8String!)!
    }
}
