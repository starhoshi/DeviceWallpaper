//
//  GradientLabel.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/14.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import UIKit

final class GradientLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    override func draw(_ rect: CGRect) {

        // begin new image context to let the superclass draw the text in (so we can use it as a mask)
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
        do {
            // get your image context
            let ctx = UIGraphicsGetCurrentContext()

            // flip context
            ctx!.scaleBy(x: 1, y: -1)
            ctx!.translateBy(x: 0, y: -bounds.size.height)

            // get the superclass to draw text
            super.draw(rect)
        }

        // get image and end context
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        // get drawRect context
        let ctx = UIGraphicsGetCurrentContext()

        // clip context to image
        ctx!.clip(to: bounds, mask: img!.cgImage!)

        // define your colors and locations
        let colors = [UIColor.blue.cgColor, UIColor.cyan.cgColor, UIColor.green.cgColor]
        let locs: [CGFloat] = [0.2, 0.5, 0.8]

        // create your gradient
        let grad = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: colors as CFArray, locations: locs)

        // draw gradient
        ctx!.drawLinearGradient(grad!, start: CGPoint(x: 0, y: 0), end: CGPoint(x: bounds.size.width, y: bounds.size.height), options: CGGradientDrawingOptions(rawValue: 0))
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
