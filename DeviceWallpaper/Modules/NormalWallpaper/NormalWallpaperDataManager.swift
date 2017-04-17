//
//  NormalWallpaperDataManager.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/17.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation

class NormalWallpaperDataManager: NormalWallpaperDataManagerInputProtocol {
    var requestHandler: NormalWallpaperDataManagerOutputProtocol?

    func retrieve() {
        requestHandler?.onRetrieved(DeviceModel())
    }
}
