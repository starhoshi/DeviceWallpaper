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
        let view = UIViewController()
        let nav = MockNavigationController(rootViewController: view)
        beforeEach {
            router.viewController = view
        }

        describe("assembleModule()") {

        }

        describe("present(for wallpaper: WallpapersType)") {
            beforeEach {
                router.present(for: .normal)
            }
            it("pushed WallpaperViewController") {
                expect(nav.pushedViewController).to(beAnInstanceOf(WallpaperViewController.self))
            }
        }
    }
}
