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
    let interactor: WallpaperListUseCase
    let router: WallpaperListWireframe

    var wallpapers: [WallpaperType] = [] {
        didSet {
            view?.show(wallpapers: wallpapers)
        }
    }

    init(interactor: WallpaperListUseCase, router: WallpaperListWireframe) {
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        interactor.fetchWallpapers()
    }

    func didSelect(wallpaper: WallpaperType) {
        router.present(for: wallpaper)
    }

    func didTapDeviceInfo() {
        router.presentDeviceInfo()
    }
}

extension WallpaperListPresenter: WallpaperListInteractorOutput {
    func wallpapersFetched(_ wallpapers: [WallpaperType]) {
        self.wallpapers = wallpapers
    }
}
