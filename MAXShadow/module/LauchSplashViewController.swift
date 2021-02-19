//
//  LauchSplashViewController.swift
//  MAXShadow
//
//  Created by 大鲨鱼 on 2018/8/15.
//  Copyright © 2018年 大鲨鱼. All rights reserved.
//

import Foundation
import UIKit

class LauchSplashViewController: UIViewController {
    var splashDuration: TimeInterval = 0.5
    
    override func viewDidLoad() {
        Thread.sleep(forTimeInterval: splashDuration)
    }
}
