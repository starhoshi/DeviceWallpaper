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
    var presenter: DeviceInfoPresentation!
    var loading: Bool = false {
        didSet {
            if loading {
                SVProgressHUD.show()
            } else {
                SVProgressHUD.dismiss()
            }
        }
    }

    // Device Information
    @IBOutlet weak var phoneName: UILabel!
    @IBOutlet weak var oSNumber: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var ram: UILabel!
    @IBOutlet weak var simCard: UILabel!

    // Extra Information
    @IBOutlet weak var hardware: UILabel!
    @IBOutlet weak var releaseLevel: UILabel!
    @IBOutlet weak var versionLevel: UILabel!
    @IBOutlet weak var multiTaskEnabled: UILabel!
    @IBOutlet weak var oSName: UILabel!
    @IBOutlet weak var type: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

extension DeviceInfoViewController: DeviceInfoView {
    func show(deviceInfo: DeviceInfo) {
        releaseDate.text = deviceInfo.releaseDate
        ram.text = deviceInfo.ram ?? "No Data"
        simCard.text = deviceInfo.simCard ?? "No Data"
    }

    func showDeviceInfoError() {
        releaseDate.text = "Error"
        ram.text = "Error"
        simCard.text = "Error"
    }

    func show(deviceModel: DeviceModel) {
        phoneName.text = deviceModel.phoneName
        oSNumber.text = deviceModel.systemVersion.fullName
        model.text = deviceModel.modelName

        hardware.text = deviceModel.hardware
        releaseLevel.text = deviceModel.releaseLevel
        versionLevel.text = deviceModel.versionLevel
        multiTaskEnabled.text = deviceModel.multiTaskEnabled ? "YES" : "NO"
        oSName.text = deviceModel.osName
        type.text = deviceModel.type.rawValue
    }
}
