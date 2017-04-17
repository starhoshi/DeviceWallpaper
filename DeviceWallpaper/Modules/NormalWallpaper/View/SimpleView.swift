//
//  SimpleView.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/14.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class SimpleView: UIView {
    let osLabel: GradientLabel = {
        let width = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
        let osLabelWidth = width - (width * 0.3)

        let label = GradientLabel(frame: CGRect(x: 0, y: 0, width: osLabelWidth, height: osLabelWidth))
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: CGFloat(osLabelWidth))
        label.textAlignment = .center

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

        addSubview(osLabel)
        osLabel.text = deviceModel.systemVersion.major
        osLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-100)
        }

        addSubview(nameLabel)
        nameLabel.text = deviceModel.modelName
        nameLabel.snp.makeConstraints { make in
            make.left.right.equalTo(0)
            switch deviceModel.type {
            case .iPad:
                make.bottom.equalTo(-140)
            default:
                make.bottom.equalTo(-90)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
