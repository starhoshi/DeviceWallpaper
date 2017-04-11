//
//  CategoriesPresenter.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/11.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation

class CategoriesPresenter: CategoriesPresentation {
    weak var view: CategoriesView?
    var interactor: CategoriesUseCase!
    var router: CategoriesWireframe!
}

extension CategoriesPresenter: CategoriesInteractorOutput {

}
