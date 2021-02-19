//
//  AppDelegate.swift
//  MAXShadow
//
//  Created by 大鲨鱼 on 2018/8/15.
//  Copyright © 2018年 大鲨鱼. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let rootVC = HomeViewController()
        let naviViewController = UINavigationController(rootViewController: rootVC)
        naviViewController.navigationBar.isHidden = true //导航栏是否隐藏
        naviViewController.navigationBar.barStyle = .default
//        naviViewController.navigationBar.barTintColor = .white //bar的颜色
//        naviViewController.navigationBar.tintColor = HexColor(hex: 0xFF0073, alpha: 1.0) //返回按钮和字的颜色
//        let dict:NSDictionary = [NSAttributedStringKey.foregroundColor: UIColor.black,NSAttributedStringKey.font : UIFont(name: "DIN-Medium", size: 18)!]
//        naviViewController.navigationBar.titleTextAttributes = dict as? [NSAttributedStringKey : AnyObject]  //标题颜色
//        naviViewController.navigationBar.isTranslucent = true  //item颜色 半透明
        naviViewController.navigationBar.shadowImage = UIImage() //设置导航栏下方1PX 的线为空
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = naviViewController
        self.window?.makeKeyAndVisible()
        LauchSplash.start(window: window)
        
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.default, animated: true)
        // 启动网络检查
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: NetworkStatusChangeNotification), object: nil, queue: OperationQueue.main) { (notify) in
            if !NetworkManager.shared.isReachable() {
                AuthorizationCheck.showAlert(title: nil, msg: "network_not_connected", goSetting: false)
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if !NetworkManager.shared.isReachable() {
                AuthorizationCheck.showAlert(title: nil, msg: "network_not_connected", goSetting: false)
            }
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

