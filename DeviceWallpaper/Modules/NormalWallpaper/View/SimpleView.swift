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
        let label = GradientLabel()
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 300)
        label.textAlignment = .center

        return label
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.white

        addSubview(osLabel)
        osLabel.text = "7"
        osLabel.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.left.right.equalTo(0)
        }
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
