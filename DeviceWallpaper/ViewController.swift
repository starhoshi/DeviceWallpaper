//
//  ViewController.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/04.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Defaults[.colorTheme]
        log?.info(Defaults[.colorTheme])
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

