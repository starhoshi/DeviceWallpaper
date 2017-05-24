//
//  MockWallpaperList.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/20.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIViewController
@testable import DeviceWallpaper

final class MockWallpaperListWireframe: WallpaperListWireframe {
    weak var viewController: UIViewController?
    var presentWasCalled = false
    var presentDeviceInfoWasCalled = false

    func present(for wallpaper: WallpaperType) {
        presentWasCalled = true
    }

    func presentDeviceInfo() {
        presentDeviceInfoWasCalled = true
    }

    static func assembleModule() -> UIViewController {
        return UIViewController()
    }
}

final class MockWallpaperListView: WallpaperListView {
    var presenter: WallpaperListPresentation
    var showWallpapersWasCalled = false

    init(presenter: WallpaperListPresentation) {
        self.presenter = presenter
    }
    func show(wallpapers: [WallpaperType]) {
        showWallpapersWasCalled = true
    }
}

final class MockWallpaperListPresenter: WallpaperListPresentation {
    weak var view: WallpaperListView?
    var interactor: WallpaperListUseCase
    var router: WallpaperListWireframe
    var viewDidLoadWasCalled = false
    var didSelectWasCalled = false
    var didTapDeviceInfoWasCalled = false

    init(interactor: WallpaperListUseCase, router: WallpaperListWireframe) {
        self.interactor = interactor
        self.router = router
    }
    func viewDidLoad() {
        viewDidLoadWasCalled = true
    }
    func didSelect(wallpaper: WallpaperType) {
        didSelectWasCalled = true
    }
    func didTapDeviceInfo() {
        didTapDeviceInfoWasCalled = true
    }
}

final class MockWallpaperListUseCase: WallpaperListUseCase {
    weak var output: WallpaperListInteractorOutput?
    var fetchWallpapersWasCalled = false

    func fetchWallpapers() {
        fetchWallpapersWasCalled = true
    }
}

class MockWallpaperListInteractorOutput: WallpaperListInteractorOutput {
    var wallpapers: [WallpaperType]?

    func wallpapersFetched(_ wallpapers: [WallpaperType]) {
        self.wallpapers = wallpapers
    }
}
