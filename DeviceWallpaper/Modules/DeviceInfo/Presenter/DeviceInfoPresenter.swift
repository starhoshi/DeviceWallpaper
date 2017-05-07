//
//  DeviceInfoPresenter.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/22.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation

final class DeviceInfoPresenter: DeviceInfoPresentation {
    weak var view: DeviceInfoView?
    var interactor: DeviceInfoUseCase
    var router: DeviceInfoWireframe

    init(interactor: DeviceInfoUseCase, router: DeviceInfoWireframe) {
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {

    }
}

extension DeviceInfoPresenter: DeviceInfoInteractorOutput {
    func didRetrieve(_ deviceInfo: DeviceInfo) {

    }
}
