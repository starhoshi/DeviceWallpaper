//
//  NormalWallpaperInteractor.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/13.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIImage

final class NormalWallpaperInteractor: NSObject, NormalWallpaperUseCase {
    weak var output: NormalWallpaperInteractorOutput!
    var dataManager: NormalWallpaperDataManagerInputProtocol?

    func retrieveDeviceModel() {
        dataManager?.retrieve()
    }

    func savePhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saved(_: didFinishSavingWithError: contextInfo:)), nil)
    }

    @objc private func saved(_ image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer) {
        if error != nil {
            output.didSaveImageFail()
        }
        output.didSaveImage()
    }
}

extension NormalWallpaperInteractor: NormalWallpaperDataManagerOutputProtocol {
    func onRetrieved(_ deviceModel: DeviceModel) {
        log?.debug(deviceModel)
        output.didRetrieve(deviceModel)
    }
}
