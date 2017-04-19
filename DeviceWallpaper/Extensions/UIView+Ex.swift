//
//  UIView+Ex.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/18.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func snapshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
        let context = UIGraphicsGetCurrentContext()!
        context.setShouldAntialias(false)
        layer.render(in: context)
        let jpgImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        let png = UIImagePNGRepresentation(jpgImage)!
        let pngImage = UIImage.init(data: png)!
        return pngImage
    }
}
