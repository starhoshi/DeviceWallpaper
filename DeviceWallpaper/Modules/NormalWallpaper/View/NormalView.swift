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

final class NormalView: UIView {
    let osLabelContainer: UIView = {
        let width = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
        let margin = width * 0.1
        let osLabelWidth = width - (margin + margin)
        let view = UIView(frame: CGRect(x: 0, y: margin, width: osLabelWidth, height: osLabelWidth))
        return view
    }()

    let osLabel: GradientLabel = {
        let label = GradientLabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1

        return label
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont(name: "AvenirNext-UltraLight", size: 50)
        label.numberOfLines = 0
        label.textAlignment = .center

        return label
    }()

    init(with deviceModel: DeviceModel) {
        super.init(frame: .zero)
        backgroundColor = UIColor.white

        addSubview(osLabelContainer)
        osLabelContainer.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.centerX.equalToSuperview()
            make.width.equalTo(osLabelContainer.frame.width)
            make.height.equalTo(osLabelContainer.frame.width * 0.75)
        }

        osLabelContainer.addSubview(osLabel)
        osLabel.text = deviceModel.systemVersion.fullName
        osLabel.font = UIFont(name: "HelveticaNeue-Light", size: CGFloat(osLabelContainer.frame.width * 0.75))
        osLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        addSubview(nameLabel)
        nameLabel.text = deviceModel.modelName
        nameLabel.snp.makeConstraints { make in
            make.left.right.equalTo(0)
            switch deviceModel.type {
            case .iPad:
                make.bottom.equalTo(-140)
            default:
                make.bottom.equalTo(-100)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
