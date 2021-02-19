//
//  Logger.swift
//  MAXShadow
//
//  Created by 大鲨鱼 on 2018/8/15.
//  Copyright © 2018年 大鲨鱼. All rights reserved.
//

import Foundation
import SwiftyBeaver

let log = SwiftyBeaver.self // 定义log

class Logger {
    class func launchConfig() -> Void {
        // add log destinations. at least one is needed!
        #if DEBUG
        let console = ConsoleDestination()  // log to Xcode Console
        log.addDestination(console)
        #endif
        
        let file = FileDestination()  // log to default swiftybeaver.log file
        log.addDestination(file)  // add the destinations to SwiftyBeaver
    }
}
