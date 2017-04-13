//
//  NormalWallpaperContract.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/13.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIViewController

//protocol WallpaperListView: class {
//    var presenter: WallpaperListPresentation! { get set }
//
//    func show(wallpapers: [WallpapersType])
//}
//
//protocol WallpaperListPresentation: class {
//    weak var view: WallpaperListView? { get set }
//    var interactor: WallpaperListUseCase! { get set }
//    var router: WallpaperListWireframe! { get set }
//
//    func viewDidLoad()
//    func didSelect(wallpaper: WallpapersType)
//}
//
//protocol WallpaperListUseCase: class {
//    weak var output: WallpaperListInteractorOutput! { get set }
//
//    func fetchWallpapers()
//}
//
//protocol WallpaperListInteractorOutput: class {
//    func wallpapersFetched(_ wallpapers: [WallpapersType])
//}

protocol NormalWallpaperWireframe: class {
    weak var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController
}
