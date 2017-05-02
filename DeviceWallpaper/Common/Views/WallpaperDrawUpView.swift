//
//  WallpaperView.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/05/02.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Device

class WallpaperDrawUpView: UIView {
    let contentView: UIView = {
        let view = UIView()
        return view
    }()

    init(size: Size) {
//        super.init(frame: CGRect(x: 0, y: 0, width: size.wallpaperSize.width, height: size.wallpaperSize.height))
        super.init(frame: .zero)

        self.snp.makeConstraints { make in
            make.width.equalTo(size.wallpaperSize.width)
            make.height.equalTo(size.wallpaperSize.height)
        }

        addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.width.equalTo(size.contentSize.width)
            make.height.equalTo(size.contentSize.width)
            make.center.equalToSuperview()
        }
    }

//    override func snapshot() -> UIImage { }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
