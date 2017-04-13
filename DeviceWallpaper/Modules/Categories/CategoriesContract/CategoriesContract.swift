//
//  CategoriesContract.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/11.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIViewController

protocol CategoriesView: class {
    var presenter: CategoriesPresentation! { get set }

    func showWallpapers(_ articles: [CategoriesType])
}

protocol CategoriesPresentation: class {
    weak var view: CategoriesView? { get set }
    var interactor: CategoriesUseCase! { get set }
    var router: CategoriesWireframe! { get set }

//    func viewDidLoad()
//    func didClickSortButton()
//    func didSelectArticle(_ article: Article)
}

protocol CategoriesUseCase: class {
    weak var output: CategoriesInteractorOutput! { get set }

//    func fetchArticles()
}

protocol CategoriesInteractorOutput: class {

}

protocol CategoriesWireframe: class {
    weak var viewController: UIViewController? { get set }

//    func presentSortOptions(sortCompletion: ((ArticlesSortType) -> ())?)
//    func presentDetails(forArticle article: Article)

    static func assembleModule() -> UIViewController
}
