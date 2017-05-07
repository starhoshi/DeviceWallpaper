//
//  WallpaperDrawUpView.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/05/07.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Device

class WallpaperDrawUpView: UIView {
    let wallpaperView: UIView = {
        let view = UIView()
        return view
    }()

    let contentView: UIView = {
        let view = UIView()
        return view
    }()

    init(size: Size, colorTheme: ColorTheme) {
        super.init(frame: .zero)

        addSubview(wallpaperView)
        wallpaperView.backgroundColor = colorTheme.backgroundColor
        wallpaperView.snp.makeConstraints { make in
            make.width.equalTo(size.wallpaperSize.width)
            make.height.equalTo(size.wallpaperSize.height)
            make.center.equalToSuperview()
        }

        wallpaperView.addSubview(contentView)
        contentView.backgroundColor = colorTheme.backgroundColor
        contentView.snp.makeConstraints { make in
            make.width.equalTo(size.contentSize.width)
            make.height.equalTo(size.contentSize.height)
            make.center.equalToSuperview()
        }
    }

    func snapshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(wallpaperView.bounds.size, true, 0.0)
        let context = UIGraphicsGetCurrentContext()!
        context.setShouldAntialias(false)
        wallpaperView.layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        let png = UIImagePNGRepresentation(image)!
        let pngImage = UIImage.init(data: png)!
        return pngImage
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
