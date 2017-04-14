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
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.orange
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
