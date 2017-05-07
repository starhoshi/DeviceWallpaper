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
        view?.loading = true
        interactor.retrieve()
    }
}

extension DeviceInfoPresenter: DeviceInfoInteractorOutput {
    func didRetrieve(_ deviceInfo: DeviceInfo) {
        view?.loading = false
        view?.show(deviceInfo: deviceInfo)
    }

    func didRetrieveDeviceInfoFail() {
        view?.loading = false
        view?.showDeviceInfoError()
    }

    func didRetrieve(_ deviceModel: DeviceModel) {
        view?.show(deviceModel: deviceModel)
    }
}
