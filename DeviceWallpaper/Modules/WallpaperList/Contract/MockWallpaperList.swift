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

    func present(for wallpaper: WallpapersType) {
        presentWasCalled = true
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
    func show(wallpapers: [WallpapersType]) {
        showWallpapersWasCalled = true
    }
}

final class MockWallpaperListPresenter: WallpaperListPresentation {
    weak var view: WallpaperListView?
    var interactor: WallpaperListUseCase
    var router: WallpaperListWireframe
    var viewDidLoadWasCalled = false
    var didSelectWasCalled = false

    init(interactor: WallpaperListUseCase, router: WallpaperListWireframe) {
        self.interactor = interactor
        self.router = router
    }
    func viewDidLoad() {
        viewDidLoadWasCalled = true
    }
    func didSelect(wallpaper: WallpapersType) {
        didSelectWasCalled = true
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
    var wallpapers: [WallpapersType]?

    func wallpapersFetched(_ wallpapers: [WallpapersType]) {
        self.wallpapers = wallpapers
    }
}
