//
//  NormalWallpaperRouter.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/13.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIViewController

final class NormalWallpaperRouter: NormalWallpaperWireframe {
    weak var viewController: UIViewController?
    static func assembleModule() -> UIViewController {
        let view = NormalWallpaperViewController()
        let presenter = NormalWallpaperPresenter()
        let interactor = NormalWallpaperInteractor()
        let dataManager = NormalWallpaperDataManager()
        let router = NormalWallpaperRouter()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.dataManager = dataManager
        interactor.output = presenter

        dataManager.requestHandler = interactor

        router.viewController = view

        return view
    }

    func present(for wallpaper: WallpapersType) {
//        let detailsModuleViewController = DetailsRouter.assembleModule(article)
        //        viewController?.navigationController?.pushViewController(detailsModuleViewController, animated: true)
    }
}
