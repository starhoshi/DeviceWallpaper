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
        let view = WallpaperListViewController()
        let presenter = WallpaperListPresenter()
        let interactor = WallpaperListInteractor()
        let router = WallpaperListRouter()

        let navigation = UINavigationController(rootViewController: view)

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.output = presenter

        router.viewController = view

        return navigation
    }

    func present(for wallpaper: WallpapersType) {
        let normalWallpaperModuleViewController = NormalWallpaperRouter.assembleModule(wallpaper: wallpaper)
        viewController?.navigationController?.pushViewController(normalWallpaperModuleViewController, animated: true)
    }
}
