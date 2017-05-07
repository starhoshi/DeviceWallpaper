//
//  DeviceInfoContractInteractor.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/22.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import APIKit

final class DeviceInfoInteractor: DeviceInfoUseCase {
    weak var output: DeviceInfoInteractorOutput?

    func retrieve() {
        let deviceModel = DeviceModel()
        output?.didRetrieve(deviceModel)

        let targetDeviceRequest = AppleDeviceAPI.TargetDeviceRequest(type: deviceModel.type, target: deviceModel.version)
        Session.shared.send(targetDeviceRequest) { [weak self] result in
            switch result {
            case .success(let deviceInfo):
                log?.info(deviceInfo)
                self?.output?.didRetrieve(deviceInfo)
            case .failure(let e):
                log?.warning(e)
                self?.output?.onErrorDeviceInfo()
            }
        }
    }
}
