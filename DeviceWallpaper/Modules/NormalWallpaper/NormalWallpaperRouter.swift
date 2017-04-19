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

    func presentSavedSuccessDialog() {
        let alert = UIAlertController(
            title: "保存成功",
            message: "画像の保存が成功しました。\nOKをタップすると壁紙設定画面に遷移しますので、壁紙として設定ください。",
            preferredStyle: .alert
        )
        let okAction: UIAlertAction = UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.default,
            handler: { _ in
                if #available(iOS 10.0, *) {
                    if let url = URL(string: "App-Prefs:root=Wallpaper") {
                        UIApplication.shared.openURL(url)
                    }
                } else {
                    if let url = URL(string: "prefs:root=Privacy&path=Wallpaper") {
                        UIApplication.shared.openURL(url)
                    }
                }
            }
        )
        alert.addAction(okAction)
        viewController?.present(alert, animated: true, completion: nil)
    }

    func presentSavedFailureDialog(with message: String) {
        let alert = UIAlertController(
            title: "保存失敗",
            message: "画像の保存に失敗しました。\n\(message)",
            preferredStyle: .alert
        )
        let okAction: UIAlertAction = UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.default,
            handler: { _ in
                if let url = URL(string: UIApplicationOpenSettingsURLString) {
                    UIApplication.shared.openURL(url)
                }
            }
        )
        alert.addAction(okAction)
        viewController?.present(alert, animated: true, completion: nil)
    }

    func presentAuthorizationDialog() {
        let alert = UIAlertController(
            title: "アクセス権限エラー",
            message: "画像ライブラリのアクセス権限がありません。\nアクセス権限を ON にしてください。",
            preferredStyle: .alert
        )
        let okAction: UIAlertAction = UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.default,
            handler: { _ in
                if let url = URL(string: UIApplicationOpenSettingsURLString) {
                    UIApplication.shared.openURL(url)
                }
            }
        )
        alert.addAction(okAction)
        viewController?.present(alert, animated: true, completion: nil)
    }
}
