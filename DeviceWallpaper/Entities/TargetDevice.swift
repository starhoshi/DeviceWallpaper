//
//  TargetDevice.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/23.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import ObjectMapper

final class TargetDevice: ImmutableMappable {
    var name: String
    var url: URL

    init(map: Map) throws {
        name = try map.value("name")
        url = try map.value("url", using: URLTransform())
    }
}

//url:
//image:
//display:
//size:
//color:
//-
//battery:
//weight:
//ram:
//voice_assistant:
//rear_camera:
//front_camera:
//sim_card:
//connector:
//name:
//release_date:
