//
//  MockWallpaper.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/05/14.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import Foundation
import UIKit.UIViewController
@testable import DeviceWallpaper

final class MockWallpaperWireframe: WallpaperWireframe {
    weak var viewController: UIViewController?
    var presentActionsWasCalled = false
    var presentAuthorizationDialogWasCalled = false
    var presentSavedSuccessDialogWasCalled = false
    var presentSavedFailureDialogWasCalled = false
    var presentSavedFailureDialogMessage: String?

    func presentActions(completion: @escaping () -> Void) {
        presentActionsWasCalled = true
    }

    func presentAuthorizationDialog() {
        presentAuthorizationDialogWasCalled = true
    }

    func presentSavedSuccessDialog() {
        presentSavedSuccessDialogWasCalled = true
    }

    func presentSavedFailureDialog(with message: String) {
        presentSavedFailureDialogWasCalled = true
        presentSavedFailureDialogMessage = message
    }

    static func assembleModule(wallpaper: WallpaperType) -> UIViewController {
        return UIViewController()
    }
}

final class MockWallpaperView: WallpaperView {
    var presenter: WallpaperPresentation
    var showSimpleWasCalled = false
    var showNormalWasCalled = false
    var showDetailWasCalled = false

    init(presenter: WallpaperPresentation) {
        self.presenter = presenter
    }

    func showSimple(deviceModel: DeviceModel, colorTheme: ColorTheme) {
        showSimpleWasCalled = true
    }
    func showNormal(deviceModel: DeviceModel, colorTheme: ColorTheme) {
        showNormalWasCalled = true
    }
    func showDetail(deviceModel: DeviceModel, colorTheme: ColorTheme) {
        showDetailWasCalled = true
    }
    func toUIImage() -> UIImage {
        return UIImage()
    }
}

final class MockWallpaperPresenter: WallpaperPresentation {
    weak var view: WallpaperView?
    var interactor: WallpaperUseCase
    var router: WallpaperWireframe
    var viewDidLoadWasCalled = false
    var didTapActionButtonWasCalled = false

    init(interactor: WallpaperUseCase, router: WallpaperWireframe, wallpaper: WallpaperType) {
        self.interactor = interactor
        self.router = router
    }
    func viewDidLoad() {
        viewDidLoadWasCalled = true
    }
    func didTapActionButton() {
        didTapActionButtonWasCalled = true
    }
}

final class MockWallpaperUseCase: WallpaperUseCase {
    weak var output: WallpaperInteractorOutput?
    var retrieveDeviceModelWasCalled = false
    var saveWasCalled = false

    func retrieveDeviceModel() {
        retrieveDeviceModelWasCalled = true
    }

    func save(image: UIImage) {
        saveWasCalled = true
    }
}

class MockWallpaperInteractorOutput: WallpaperInteractorOutput {
    var deviceModel: DeviceModel?
    var notAuthorizedPhotoLibraryWasCalled = false
    var didSaveImageWasCalled = false
    var didSaveImageFailWasCalled = false

    func didRetrieve(_ deviceModel: DeviceModel) {
        self.deviceModel = deviceModel
    }

    func notAuthorizedPhotoLibrary() {
        self.notAuthorizedPhotoLibraryWasCalled = true
    }
    func didSaveImage() {
        self.didSaveImageWasCalled = true
    }
    func didSaveImageFail(with message: String) {
        self.didSaveImageFailWasCalled = true
    }
}
