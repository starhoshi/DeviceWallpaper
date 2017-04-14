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
    let osLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 300)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.darkGray

        addSubview(osLabel)
        osLabel.text = "10"
        osLabel.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
