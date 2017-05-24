//
//  WallpaperListRouter.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/11.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIViewController

final class WallpaperListRouter: WallpaperListWireframe {
    weak var viewController: UIViewController?

    static func assembleModule() -> UIViewController {
        let interactor = WallpaperListInteractor()
        let router = WallpaperListRouter()
        let presenter = WallpaperListPresenter(interactor: interactor, router: router)
        let view = WallpaperListViewController(presenter: presenter)

        let navigation = UINavigationController(rootViewController: view)

        presenter.view = view

        interactor.output = presenter

        router.viewController = view

        return navigation
    }

    func present(for wallpaper: WallpaperType) {
        let wallpaperViewController = WallpaperRouter.assembleModule(wallpaper: wallpaper)
        viewController?.navigationController?.pushViewController(wallpaperViewController, animated: true)
    }

    func presentDeviceInfo() {
        let deviceInfoViewController = DeviceInfoRouter.assembleModule()
        viewController?.navigationController?.pushViewController(deviceInfoViewController, animated: true)
    }
}
