//
//  CategoriesRouter.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/11.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIViewController

protocol CategoriesWireframe: class {
    weak var viewController: UIViewController? { get set }

//    func presentSortOptions(sortCompletion: ((ArticlesSortType) -> ())?)
//    func presentDetails(forArticle article: Article)

    static func assembleModule() -> UIViewController
}

final class CategoriesRouter: CategoriesWireframe {
    weak var viewController: UIViewController?
    static func assembleModule() -> UIViewController {
        let vc = ViewController()
//        let presenter = ArticlesPresenter()
//        let interactor = ArticlesInteractor()
        let router = CategoriesRouter()
//
        let navigation = UINavigationController(rootViewController: vc)

//        view?.presenter = presenter
//
//        presenter.view = view
//        presenter.interactor = interactor
//        presenter.router = router
//
//        interactor.output = presenter
//
        router.viewController = vc

        return navigation
    }
}
