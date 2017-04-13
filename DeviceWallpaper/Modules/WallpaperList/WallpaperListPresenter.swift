//
//  WallpaperListPresenter.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/11.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation

final class WallpaperListPresenter: WallpaperListPresentation {
    weak var view: WallpaperListView?
    var interactor: WallpaperListUseCase!
    var router: WallpaperListWireframe!

    var wallpapers: [WallpapersType] = [] {
        didSet {
            log?.info(wallpapers)
            view?.show(wallpapers: wallpapers)
        }
    }

    func viewDidLoad() {
        interactor.fetchWallpapers()
    }

    func didSelect(wallpaper: WallpapersType) {
        router.present(for: wallpaper)
    }
}

extension WallpaperListPresenter: WallpaperListInteractorOutput {
    func wallpapersFetched(_ wallpapers: [WallpapersType]) {
        self.wallpapers = wallpapers
    }
}
