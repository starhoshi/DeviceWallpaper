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

final class NormalWallpaperInteractor: NSObject, NormalWallpaperUseCase {
    weak var output: NormalWallpaperInteractorOutput!
    var dataManager: NormalWallpaperDataManagerInputProtocol?

    func retrieveDeviceModel() {
        dataManager?.retrieve()
    }

    func save(image: UIImage) {
        PHPhotoLibrary.requestAuthorization { [weak self] status in
            switch status {
            case .authorized, .notDetermined:
                UIImageWriteToSavedPhotosAlbum(image, self, #selector(self?.saved(_: didFinishSavingWithError: contextInfo:)), nil)
            case .denied, .restricted:
                self?.output.notAuthorizedPhotoLibrary()
            }
        }
    }

    @objc private func saved(_ image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer) {
        if error != nil {
            output.didSaveImageFail(with: error.localizedDescription)
        } else {
            output.didSaveImage()
        }
    }
}

extension NormalWallpaperInteractor: NormalWallpaperDataManagerOutputProtocol {
    func onRetrieved(_ deviceModel: DeviceModel) {
        log?.debug(deviceModel)
        output.didRetrieve(deviceModel)
    }
}
