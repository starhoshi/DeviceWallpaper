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

    func presentActions(completion: @escaping () -> Void) {
        let alert = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )

        alert.addAction(UIAlertAction(
            title: "Export as Image",
            style: .default,
            handler: { _ in
                completion()
            }
        ))

        alert.addAction(UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil
        ))

        alert.popoverPresentationController?.sourceView = viewController?.view
        alert.popoverPresentationController?.barButtonItem = viewController?.navigationItem.rightBarButtonItem
        viewController?.present(alert, animated: true, completion: nil)
    }
}
