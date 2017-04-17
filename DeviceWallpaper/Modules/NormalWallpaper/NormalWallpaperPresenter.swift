//
//  NormalWallpaperPresenter.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/13.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation

final class NormalWallpaperPresenter: NormalWallpaperPresentation {
    weak var view: NormalWallpaperView?
    var interactor: NormalWallpaperUseCase!
    var router: NormalWallpaperWireframe!

    func viewDidLoad() {
        interactor.retrieveDeviceModel()
    }
}

extension NormalWallpaperPresenter: NormalWallpaperInteractorOutput {
    func didRetrieve(_ deviceModel: DeviceModel) {
        view?.showSimple(deviceModel: deviceModel)
    }
}
