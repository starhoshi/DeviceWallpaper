//
//  NormalWallpaperContract.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/13.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIViewController

//protocol NormalWallpaperView: class {
//    var presenter: NormalWallpaperPresentation! { get set }
//
//    func show(wallpapers: [WallpapersType])
//}
//
//protocol NormalWallpaperPresentation: class {
//    weak var view: NormalWallpaperView? { get set }
//    var interactor: NormalWallpaperUseCase! { get set }
//    var router: NormalWallpaperWireframe! { get set }
//
//    func viewDidLoad()
//    func didSelect(wallpaper: WallpapersType)
//}
//
//protocol NormalWallpaperUseCase: class {
//    weak var output: NormalWallpaperInteractorOutput! { get set }
//
//    func fetchWallpapers()
//}
//
//protocol NormalWallpaperInteractorOutput: class {
//    func wallpapersFetched(_ wallpapers: [WallpapersType])
//}

protocol NormalWallpaperWireframe: class {
    weak var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController
}
