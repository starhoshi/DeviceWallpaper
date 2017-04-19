//
//  NormalWallpaperContract.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/13.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIViewController
import UIKit.UIImage

protocol NormalWallpaperWireframe: class {
    weak var viewController: UIViewController? { get set }

    func presentActions(completion: @escaping () -> Void)
    func presentAuthorizationDialog()
    func presentSavedSuccessDialog()
    func presentSavedFailureDialog(with message: String)
    static func assembleModule(wallpaper: WallpapersType) -> UIViewController
}

protocol NormalWallpaperView: class {
    var presenter: NormalWallpaperPresentation! { get set }

    func showSimple(deviceModel: DeviceModel)
    func showNormal(deviceModel: DeviceModel)
    func toUIImage() -> UIImage
}

protocol NormalWallpaperPresentation: class {
    weak var view: NormalWallpaperView? { get set }
    var interactor: NormalWallpaperUseCase! { get set }
    var router: NormalWallpaperWireframe! { get set }

    init(wallpaper: WallpapersType)

    func viewDidLoad()
    func didTapActionButton()
}

protocol NormalWallpaperUseCase: class {
    weak var output: NormalWallpaperInteractorOutput! { get set }
    var dataManager: NormalWallpaperDataManagerInputProtocol? { get set }

    func retrieveDeviceModel()
    func save(image: UIImage)
}

protocol NormalWallpaperInteractorOutput: class {
    func didRetrieve(_ deviceModel: DeviceModel)
    func notAuthorizedPhotoLibrary()
    func didSaveImage()
    func didSaveImageFail(with message: String)
}

protocol NormalWallpaperDataManagerInputProtocol: class {
    var requestHandler: NormalWallpaperDataManagerOutputProtocol? { get set }

    // INTERACTOR -> DATAMANAGER
    func retrieve()
}

protocol NormalWallpaperDataManagerOutputProtocol: class {
    // DATAMANAGER -> INTERACTOR
    func onRetrieved(_ deviceModel: DeviceModel)
}
