//
//  Const.swift
//  MAXShadow
//
//  Created by 大鲨鱼 on 2018/8/15.
//  Copyright © 2018年 大鲨鱼. All rights reserved.
//

import Foundation
import UIKit



func HexColor(hex:integer_t, alpha:CGFloat) -> UIColor
{
    return UIColor(red: CGFloat((hex >> 16) & 0xff)/255.0, green: CGFloat((hex >> 8) & 0xff)/255.0, blue: CGFloat(hex & 0xff)/255.0, alpha: alpha)
}


func JKLog(_ items: Any..., separator: String = " ", terminator: String = "\n",
           _ file: String = #file, _ line: Int = #line, _ function: String = #function) -> Void {
    #if DEBUG
    var str: String = ((file as NSString).pathComponents.last)!
    str = "\(str):\(line):\(function): "
    print(str, items)
    #endif
}



extension UIViewController {
    class var current: UIViewController {
        get {
            let rootVC: UIViewController! = UIApplication.shared.delegate!.window!?.rootViewController!
            return findBest(rootVC)
        }
    }
    
    private class func findBest(_ vc: UIViewController) -> UIViewController {
        if (vc.presentedViewController != nil) {
            // Return presented view controller
            return findBest(vc.presentedViewController!)
            
        } else if (vc is UISplitViewController) {
            // Return right hand side
            let svc = vc as! UISplitViewController;
            if (svc.viewControllers.count > 0) {
                return findBest(svc.viewControllers.last!)
            } else {
                return vc
            }
        } else if (vc is UINavigationController) {
            // Return top view
            let svc = vc as! UINavigationController
            if (svc.viewControllers.count > 0) {
                return findBest(svc.topViewController!)
            } else {
                return vc
            }
        } else if (vc is UITabBarController) {
            // Return visible view
            let svc = vc as! UITabBarController
            if ((svc.viewControllers?.count)! > 0) {
                return findBest(svc.selectedViewController!)
            } else {
                return vc;
            }
        } else {
            // Unknown view controller type, return last child view controller
            return vc;
        }
    }
}
