//
//  WallpaperListInteractorSpec.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/20.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Quick
import Nimble
@testable import DeviceWallpaper

class WallpaperListInteractorSpec: QuickSpec {
    override func spec() {
        let output = MockWallpaperListInteractorOutput()
        let interactor = WallpaperListInteractor()
        beforeEach {
            interactor.output = output
        }
        describe("fetchWallpapers()") {
            beforeEach {
                interactor.fetchWallpapers()
            }
            it("return wallpapers") {
                expect(output.wallpapers).to(equal(WallpapersType.toArray()))
            }
        }
    }
}
