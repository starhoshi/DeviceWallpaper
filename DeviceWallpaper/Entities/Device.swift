//
//  Device.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/14.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIDevice
import Device

struct DeviceModel {
    var phoneName: String
    var model: String
    var localizedModel: String
    var systemName: String
    var multiTaskEnabled: Bool
    var modelName: String
    var systemVersion: SystemVersion
    var type: Type
    var version: Version
    var osName: String
    var hardware: String
    var releaseLevel: String
    var versionLevel: String

    init() {
        phoneName = UIDevice.current.name
        model = UIDevice.current.model
        localizedModel = UIDevice.current.localizedModel
        systemName = UIDevice.current.systemName
        multiTaskEnabled = UIDevice.current.isMultitaskingSupported
        modelName = Device.version().modelName
        systemVersion = SystemVersion()
        type = Device.type()
        version = Device.version()

        var systemInfo = utsname()
        uname(&systemInfo)

        osName = String(validatingUTF8: NSString(bytes: &systemInfo.sysname, length: Int(_SYS_NAMELEN), encoding: String.Encoding.ascii.rawValue)!.utf8String!)!
        releaseLevel = String(validatingUTF8: NSString(bytes: &systemInfo.release, length: Int(_SYS_NAMELEN), encoding: String.Encoding.ascii.rawValue)!.utf8String!)!
        versionLevel = String(validatingUTF8: NSString(bytes: &systemInfo.version, length: Int(_SYS_NAMELEN), encoding: String.Encoding.ascii.rawValue)!.utf8String!)!
        hardware = String(validatingUTF8: NSString(bytes: &systemInfo.machine, length: Int(_SYS_NAMELEN), encoding: String.Encoding.ascii.rawValue)!.utf8String!)!
    }
}
