//
//  WallpaperListContract.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/11.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIViewController

protocol WallpaperListWireframe: class {
    weak var viewController: UIViewController? { get set }

    func present(for wallpaper: WallpapersType)

    static func assembleModule() -> UIViewController
}

protocol WallpaperListView: class {
    var presenter: WallpaperListPresentation { get }

    init(presenter: WallpaperListPresentation)
    func show(wallpapers: [WallpapersType])
}

protocol WallpaperListPresentation: class {
    weak var view: WallpaperListView? { get set }
    var interactor: WallpaperListUseCase { get }
    var router: WallpaperListWireframe { get }

    init(interactor: WallpaperListUseCase, router: WallpaperListWireframe)
    func viewDidLoad()
    func didSelect(wallpaper: WallpapersType)
}

protocol WallpaperListUseCase: class {
    weak var output: WallpaperListInteractorOutput? { get set }

    func fetchWallpapers()
}

protocol WallpaperListInteractorOutput: class {
    func wallpapersFetched(_ wallpapers: [WallpapersType])
}
