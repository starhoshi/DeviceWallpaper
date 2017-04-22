//
//  DeviceInfoRouter.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/22.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIViewController

final class DeviceInfoRouter: DeviceInfoWireframe {
    weak var viewController: UIViewController?

    static func assembleModule() -> UIViewController {
//        let interactor = WallpaperInteractor()
//        let router = WallpaperRouter()
//        let presenter = WallpaperPresenter(interactor: interactor, router: router, wallpaper: wallpaper)
        let view = DeviceInfoViewController.instantiate()
//        let view = WallpaperViewController(presenter: presenter)
//        let dataManager = WallpaperDataManager()
//
//        presenter.view = view
//
//        interactor.dataManager = dataManager
//        interactor.output = presenter
//
//        dataManager.requestHandler = interactor
//
//        router.viewController = view

        return view
    }

}
