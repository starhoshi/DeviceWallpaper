//
//  WallpaperListRouterSpec.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/20.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Quick
import Nimble
@testable import DeviceWallpaper

class WallpaperListRouterSpec: QuickSpec {
    override func spec() {
        let router = WallpaperListRouter()
        let vc = UIViewController()
        beforeEach {
            router.viewController = vc
        }

        describe("present(for wallpaper: WallpapersType)") {
            beforeEach {
                router.present(for: .normal)
            }
            it("show WallpaperViewController") {
                let wallpaperModuleViewController = WallpaperRouter.assembleModule(wallpaper: .normal)
                print(router.viewController)
                expect(router.viewController?.navigationController?.topViewController).to(equal(wallpaperModuleViewController))
            }

        }

    }
}
