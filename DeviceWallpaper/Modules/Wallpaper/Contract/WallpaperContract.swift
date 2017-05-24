//
//  WallpaperContract.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/13.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIViewController
import UIKit.UIImage

protocol WallpaperWireframe: class {
    weak var viewController: UIViewController? { get set }

    func presentActions(completion: @escaping () -> Void)
    func presentAuthorizationDialog()
    func presentSavedSuccessDialog()
    func presentSavedFailureDialog(with message: String)
    static func assembleModule(wallpaper: WallpaperType) -> UIViewController
}

protocol WallpaperView: class {
    var presenter: WallpaperPresentation { get }

    init(presenter: WallpaperPresentation)
    func showSimple(deviceModel: DeviceModel, colorTheme: ColorTheme)
    func showNormal(deviceModel: DeviceModel, colorTheme: ColorTheme)
    func showDetail(deviceModel: DeviceModel, colorTheme: ColorTheme)
    func toUIImage() -> UIImage
}

protocol WallpaperPresentation: class {
    weak var view: WallpaperView? { get set }
    var interactor: WallpaperUseCase { get }
    var router: WallpaperWireframe { get }

    init(interactor: WallpaperUseCase, router: WallpaperWireframe, wallpaper: WallpaperType)

    func viewDidLoad()
    func didTapActionButton()
}

protocol WallpaperUseCase: class {
    weak var output: WallpaperInteractorOutput? { get set }

    func retrieveDeviceModel()
    func save(image: UIImage)
}

protocol WallpaperInteractorOutput: class {
    func didRetrieve(_ deviceModel: DeviceModel)
    func notAuthorizedPhotoLibrary()
    func didSaveImage()
    func didSaveImageFail(with message: String)
}
