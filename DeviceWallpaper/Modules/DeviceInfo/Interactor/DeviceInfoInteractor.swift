//
//  DeviceInfoContractInteractor.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/22.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation

final class DeviceInfoInteractor: DeviceInfoUseCase {
    weak var output: DeviceInfoInteractorOutput?
    var dataManager: DeviceInfoDataManagerInputProtocol?

    func retrieveDeviceInfo() {

    }
}

extension DeviceInfoInteractor: DeviceInfoDataManagerOutputProtocol {
    func onRetrieved(_ deviceInfo: DeviceInfo) {
        log?.debug(deviceInfo)
        output?.didRetrieve(deviceInfo)
    }
}
