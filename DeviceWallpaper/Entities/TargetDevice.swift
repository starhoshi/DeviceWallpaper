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
    let url: URL
    let image: URL
    let display: String?
    let size: String?
    let color: [String]?
    let battery: String?
    let weight: String?
    let ram: String?
    let voiceAssistant: String?
    let rearCamera: String?
    let frontCamera: String?
    let simCard: String?
    let connector: String?
    let name: String
    let releaseDate: String

    init(map: Map) throws {
        url = try map.value("url", using: URLTransform())
        image = try map.value("image", using: URLTransform())
        display = try? map.value("display")
        size = try? map.value("size")
        color = try? map.value("color")
        battery = try? map.value("battery")
        weight = try? map.value("weight")
        ram = try? map.value("ram")
        voiceAssistant = try? map.value("voice_assistant")
        rearCamera = try? map.value("rear_camera")
        frontCamera = try? map.value("front_camera")
        simCard = try? map.value("sim_card")
        connector = try? map.value("connector")
        name = try map.value("name")
        releaseDate = try map.value("release_date")
    }
}
