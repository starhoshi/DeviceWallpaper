//
//  DeviceInfoViewController.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/22.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import UIKit
import SVProgressHUD
import APIKit

final class DeviceInfoViewController: UITableViewController, Storyboardable {

    // Device Information
    @IBOutlet weak var phoneName: UILabel!
    @IBOutlet weak var oSNumber: UILabel!
    @IBOutlet weak var model: UILabel!

    // Extra Information
    @IBOutlet weak var userAgent: UILabel!
    @IBOutlet weak var hardware: UILabel!
    @IBOutlet weak var releaseLevel: UILabel!
    @IBOutlet weak var versionLevel: UILabel!
    @IBOutlet weak var multiTaskEnabled: UILabel!
    @IBOutlet weak var oSName: UILabel!
    @IBOutlet weak var type: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let deviceModel = DeviceModel()
        loadAppleDevice(model: deviceModel)

        phoneName.text = deviceModel.phoneName
        oSNumber.text = deviceModel.systemVersion.fullName
        model.text = deviceModel.modelName
        userAgent.text = deviceModel.userAgent.value

        hardware.text = deviceModel.hardware
        releaseLevel.text = deviceModel.releaseLevel
        versionLevel.text = deviceModel.versionLevel
        multiTaskEnabled.text = deviceModel.multiTaskEnabled ? "YES" : "NO"
        oSName.text = deviceModel.osName
        type.text = deviceModel.type.rawValue
    }

    func loadAppleDevice(model: DeviceModel) {
        SVProgressHUD.show()
        let targetDeviceRequest = AppleDeviceAPI.TargetDeviceRequest(type: model.type, target: model.version)
        Session.shared.send(targetDeviceRequest) { result in
            SVProgressHUD.dismiss()
            switch result {
            case .success(let targetDevice):
                log?.info(targetDevice)
            case .failure(let targetDevice):
                log?.error(targetDevice)
            }
        }
    }
}
