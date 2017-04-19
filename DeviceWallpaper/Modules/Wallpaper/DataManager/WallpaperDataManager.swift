//
//  WallpaperDataManager.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/17.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation

class WallpaperDataManager: WallpaperDataManagerInputProtocol {
    var requestHandler: WallpaperDataManagerOutputProtocol?

    func retrieve() {
        requestHandler?.onRetrieved(DeviceModel())
    }
}
