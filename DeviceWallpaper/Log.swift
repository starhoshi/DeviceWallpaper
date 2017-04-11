//
//  Log.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/11.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import SwiftyBeaver

let log: SwiftyBeaver.Type? = {
    let logger = SwiftyBeaver.self
    let consoleFormat = "$C$C$c $DHH:mm:ss.SSS$d [$L][$T] $N.$F:$l - $M $C$C$c"
    let fileFormat = "$Dyyyy-MM-dd HH:mm:ss.SSS$d [$L][$T] $N.$F:$l - $M"
    
    let file = FileDestination()
    file.format = fileFormat
    
    let console = ConsoleDestination()
    console.asynchronously = false
    console.format = consoleFormat
    console.levelColor.verbose = "🍵"
    console.levelColor.debug = "🐹"
    console.levelColor.info = "ℹ️"
    console.levelColor.warning = "⚠️"
    console.levelColor.error = "💣"
    
    #if RELEASE
        return nil
    #elseif STAGING
        logger.addDestination(file)
        
        return logger
    #else
        logger.addDestination(console)
        logger.addDestination(file)
        
        return logger
    #endif
}()
