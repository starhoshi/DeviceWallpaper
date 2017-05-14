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
        let navigation = MockNavigationController(rootViewController: view)
        beforeEach {
            router.viewController = view
        }

        describe("assembleModule()") {
            let module = WallpaperListRouter.assembleModule()
            it("return UINavigationController") {
                expect(module).to(beAnInstanceOf(UINavigationController.self))
            }
        }

        describe("present(for wallpaper: WallpapersType)") {
            beforeEach {
                router.present(for: .normal(.white))
            }
            it("pushed WallpaperViewController") {
                expect(navigation.pushedViewController).to(beAnInstanceOf(WallpaperViewController.self))
            }
        }

        describe("presentDeviceInfo") {
            beforeEach {
                router.presentDeviceInfo()
            }
            it("pushed WallpaperViewController") {
                expect(navigation.pushedViewController).to(beAnInstanceOf(DeviceInfoViewController.self))
            }
        }
    }
}
