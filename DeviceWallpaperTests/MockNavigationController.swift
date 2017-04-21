//
//  MockNavigationController.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/21.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit

class MockNavigationController: UINavigationController {
    var pushedViewController: UIViewController?

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
        super.pushViewController(viewController, animated: true)
    }
}
