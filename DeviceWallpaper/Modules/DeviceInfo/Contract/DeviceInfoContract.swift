//
//  DeviceInfoContract.swift
//  DeviceDeviceInfo
//
//  Created by Kensuke Hoshikawa on 2017/04/22.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIViewController

protocol DeviceInfoWireframe: class {
    weak var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController
}

protocol DeviceInfoView: class {
    var presenter: DeviceInfoPresentation! { get }
    var loading: Bool { get set }

    func show(deviceInfo: DeviceInfo)
    func showDeviceInfoError()
    func show(deviceModel: DeviceModel)
}

protocol DeviceInfoPresentation: class {
    weak var view: DeviceInfoView? { get set }
    var interactor: DeviceInfoUseCase { get }
    var router: DeviceInfoWireframe { get }

    init(interactor: DeviceInfoUseCase, router: DeviceInfoWireframe)

    func viewDidLoad()
}

protocol DeviceInfoUseCase: class {
    weak var output: DeviceInfoInteractorOutput? { get set }

    func retrieve()
}

protocol DeviceInfoInteractorOutput: class {
    func didRetrieve(_ deviceInfo: DeviceInfo)
    func didRetrieveDeviceInfoFail()
    func didRetrieve(_ deviceModel: DeviceModel)
}
