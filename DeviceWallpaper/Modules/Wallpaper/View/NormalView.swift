//
//  NormalView.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/19.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class NormalView: UIView, Wallpaperable {
    let wallpaper: UIView = {
        let view = UIView()
        return view
    }()

    let contentView: UIView = {
        let view = UIView()
        return view
    }()

    let osLabel: GradientLabel = {
        let height = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height) / 2

        let label = GradientLabel(frame: CGRect(x: 0, y: 0, width: 0, height: height))
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: CGFloat(height * 0.8))
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1

        return label
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont(name: "AvenirNext-Medium", size: 45)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1

        return label
    }()

    let phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont(name: "AvenirNext-Medium", size: 20)
        label.textAlignment = .center
        label.numberOfLines = 0

        return label
    }()

    let hardwareLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont(name: "AvenirNext-Medium", size: 20)
        label.textAlignment = .center
        label.numberOfLines = 0

        return label
    }()

    init(with deviceModel: DeviceModel, colorTheme: ColorTheme) {
        super.init(frame: .zero)

        addSubview(wallpaper)
        wallpaper.backgroundColor = colorTheme.backgroundColor
        wallpaper.snp.makeConstraints { make in
            make.width.equalTo(deviceModel.size.wallpaperSize.width)
            make.height.equalTo(deviceModel.size.wallpaperSize.height)
            make.center.equalToSuperview()
        }

        wallpaper.addSubview(contentView)
        contentView.backgroundColor = colorTheme.backgroundColor
        contentView.snp.makeConstraints { make in
            make.width.equalTo(deviceModel.size.contentSize.width)
            make.height.equalTo(deviceModel.size.contentSize.height)
            make.center.equalToSuperview()
        }

        osLabel.colors = colorTheme.gradiation
        osLabel.text = deviceModel.systemVersion.fullName
        contentView.addSubview(osLabel)
        osLabel.snp.makeConstraints { make in
            switch deviceModel.type {
            case .iPad:
                make.top.equalTo(0)
            default:
                make.top.equalTo(30)
            }
            make.left.equalTo(8)
            make.right.equalTo(-8)
        }

        contentView.addSubview(nameLabel)
        nameLabel.text = deviceModel.modelName
        nameLabel.textColor = colorTheme.fontColor
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(8)
            make.right.equalTo(-8)
            make.height.equalTo(75)
            make.top.equalTo(osLabel.snp.bottom).offset(8)
        }

        contentView.addSubview(hardwareLabel)
        hardwareLabel.text = "Model: " + deviceModel.hardware
        hardwareLabel.textColor = colorTheme.fontColor
        hardwareLabel.snp.makeConstraints { make in
            make.left.equalTo(8)
            make.right.equalTo(-8)
            make.height.equalTo(24)
            switch deviceModel.type {
            case .iPad:
                make.bottom.equalTo(-160)
            default:
                make.bottom.equalTo(-120)
            }
        }

        contentView.addSubview(phoneLabel)
        phoneLabel.text = "Name: " + deviceModel.phoneName
        phoneLabel.textColor = colorTheme.fontColor
        phoneLabel.snp.makeConstraints { make in
            make.left.equalTo(8)
            make.right.equalTo(-8)
            make.height.equalTo(24)
            make.bottom.equalTo(hardwareLabel.snp.top).offset(-16)
        }
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
