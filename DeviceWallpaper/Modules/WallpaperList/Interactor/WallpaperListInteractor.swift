//
//  WallpaperListInteractor.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/11.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation

final class WallpaperListInteractor: WallpaperListUseCase {
    weak var output: WallpaperListInteractorOutput!

    func fetchWallpapers() {
        output.wallpapersFetched(WallpapersType.toArray())
    }
}
