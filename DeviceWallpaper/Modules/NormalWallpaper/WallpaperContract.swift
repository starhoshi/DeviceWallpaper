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
    static func assembleModule(wallpaper: WallpapersType) -> UIViewController
}

protocol WallpaperView: class {
    var presenter: WallpaperPresentation! { get set }

    func showSimple(deviceModel: DeviceModel)
    func showNormal(deviceModel: DeviceModel)
    func toUIImage() -> UIImage
}

protocol WallpaperPresentation: class {
    weak var view: WallpaperView? { get set }
    var interactor: WallpaperUseCase! { get set }
    var router: WallpaperWireframe! { get set }

    init(wallpaper: WallpapersType)

    func viewDidLoad()
    func didTapActionButton()
}

protocol WallpaperUseCase: class {
    weak var output: WallpaperInteractorOutput! { get set }
    var dataManager: WallpaperDataManagerInputProtocol? { get set }

    func retrieveDeviceModel()
    func save(image: UIImage)
}

protocol WallpaperInteractorOutput: class {
    func didRetrieve(_ deviceModel: DeviceModel)
    func notAuthorizedPhotoLibrary()
    func didSaveImage()
    func didSaveImageFail(with message: String)
}

protocol WallpaperDataManagerInputProtocol: class {
    var requestHandler: WallpaperDataManagerOutputProtocol? { get set }

    // INTERACTOR -> DATAMANAGER
    func retrieve()
}

protocol WallpaperDataManagerOutputProtocol: class {
    // DATAMANAGER -> INTERACTOR
    func onRetrieved(_ deviceModel: DeviceModel)
}
