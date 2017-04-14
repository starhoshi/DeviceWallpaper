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
    var barHidden: Bool = false {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
            navigationController?.setNavigationBarHidden(barHidden, animated: true)
        }
    }
    var wallpaper: String = "" {
        didSet {
            navigationItem.title = wallpaper
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: nil)
        presenter.viewDidLoad()
    }

    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .none
    }

    override var prefersStatusBarHidden: Bool {
        return barHidden
    }
}

extension NormalWallpaperViewController: NormalWallpaperView {
    func showSimple(wallpaper: String) {
        self.wallpaper = wallpaper
        let simple = SimpleView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(NormalWallpaperViewController.tapGesture(_:)))
        simple.addGestureRecognizer(tap)
        view = simple
    }

    func tapGesture(_ sender: UITapGestureRecognizer) {
        barHidden = !barHidden
    }
}
