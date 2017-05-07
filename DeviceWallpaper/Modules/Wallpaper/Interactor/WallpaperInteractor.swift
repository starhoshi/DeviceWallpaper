//
//  NormalWallpaperInteractor.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/13.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit.UIImage
import Photos

final class WallpaperInteractor: NSObject, WallpaperUseCase {
    weak var output: WallpaperInteractorOutput?

    func retrieveDeviceModel() {
        output?.didRetrieve(DeviceModel())
    }

    func save(image: UIImage) {
        PHPhotoLibrary.requestAuthorization { [weak self] status in
            switch status {
            case .authorized, .notDetermined:
                UIImageWriteToSavedPhotosAlbum(image, self, #selector(self?.saved(_: didFinishSavingWithError: contextInfo:)), nil)
            case .denied, .restricted:
                self?.output?.notAuthorizedPhotoLibrary()
            }
        }
    }

    @objc private func saved(_ image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer) {
        if error != nil {
            output?.didSaveImageFail(with: error.localizedDescription)
        } else {
            output?.didSaveImage()
        }
    }
}
