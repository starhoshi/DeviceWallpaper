//
//  NormalWallpaperViewController.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/13.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import UIKit

class NormalWallpaperViewController: UIViewController {
    var presenter: NormalWallpaperPresentation!
    var wallpaper: String = "" {
        didSet {
            navigationItem.title = wallpaper
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.viewDidLoad()
    }
}

extension NormalWallpaperViewController: NormalWallpaperView {
    func show(wallpaper: String) {
        self.wallpaper = wallpaper
    }
}
