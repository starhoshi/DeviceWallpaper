//
//  NormalWallpaperContract.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/13.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIViewController

protocol NormalWallpaperWireframe: class {
    weak var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController
}

protocol NormalWallpaperView: class {
    var presenter: NormalWallpaperPresentation! { get set }

    func showSimple(deviceModel: DeviceModel)
}

protocol NormalWallpaperPresentation: class {
    weak var view: NormalWallpaperView? { get set }
    var interactor: NormalWallpaperUseCase! { get set }
    var router: NormalWallpaperWireframe! { get set }

    func viewDidLoad()
}

protocol NormalWallpaperUseCase: class {
    weak var output: NormalWallpaperInteractorOutput! { get set }
    var datamanager: NormalWallpaperDataManagerInputProtocol? { get set }

    func retrieveDeviceModel()
}

protocol NormalWallpaperInteractorOutput: class {
    func didRetrieve(_ deviceModel: DeviceModel)
}

protocol NormalWallpaperDataManagerInputProtocol: class {
    var remoteRequestHandler: NormalWallpaperDataManagerOutputProtocol? { get set }

    // INTERACTOR -> DATAMANAGER
    func retrieve()
}

protocol NormalWallpaperDataManagerOutputProtocol: class {
    // DATAMANAGER -> INTERACTOR
    func onRetrieved(_ deviceModel: DeviceModel)
}
