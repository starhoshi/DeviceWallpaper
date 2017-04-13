//
//  WallpaperListPresenter.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/11.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation

final class WallpaperListPresenter: WallpaperListPresentation {
    weak var view: WallpaperListView?
    var interactor: WallpaperListUseCase!
    var router: WallpaperListWireframe!

    func viewDidLoad() {
//        interactor.fetchWallpaperList()
//        view?.showActivityIndicator()
    }
    
    func didSelect(wallpaper: WallpapersType){
//        router.presentDetails(for wallpaper: WallpapersType)
    }
}

extension WallpaperListPresenter: WallpaperListInteractorOutput {

}
