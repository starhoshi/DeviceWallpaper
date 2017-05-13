//
//  WallpaperListPresenterSpec.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/20.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Quick
import Nimble
@testable import DeviceWallpaper

class WallpaperListPresenterSpec: QuickSpec {
    override func spec() {
        let interactor = MockWallpaperListUseCase()
        let router = MockWallpaperListWireframe()
        let presenter = WallpaperListPresenter(interactor: interactor, router: router)
        let view = MockWallpaperListView(presenter: presenter)
        beforeEach {
            presenter.view = view
        }

        describe("viewDidLoad") {
            beforeEach {
                interactor.fetchWallpapersWasCalled = false
                presenter.viewDidLoad()
            }
            it("interactor.fetchWallpapers() is colled") {
                expect(interactor.fetchWallpapersWasCalled).to(beTrue())
            }
        }

        describe("didSelect(wallpaper: WallpapersType)") {
            beforeEach {
                router.presentWasCalled = false
                presenter.didSelect(wallpaper: .normal(.white))
            }
            it("present(for wallpaper: WallpapersType) is called") {
                expect(router.presentWasCalled).to(beTrue())
            }
        }

        describe("wallpapersFetched(_ wallpapers: [WallpapersType])") {
            beforeEach {
                view.showWallpapersWasCalled = false
                presenter.wallpapersFetched(WallpapersType.toArray())
            }
            it("view.show(wallpapers: wallpapers) is called") {
                expect(view.showWallpapersWasCalled).to(beTrue())
            }
        }
    }
}
