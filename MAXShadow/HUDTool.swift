//
//  HUDTool.swift
//  MAXShadow
//
//  Created by 大鲨鱼 on 2018/8/15.
//  Copyright © 2018年 大鲨鱼. All rights reserved.
//

import Foundation
import Chrysan
import RSLoadingView

class HUDTool {
    class func defaultProgressImages() -> Array<UIImage> {
        return progressImages(bundle: "Loading")
    }
    
    class func progressImages(bundle: String) -> Array<UIImage> {
        let path = Bundle.main.path(forResource: bundle, ofType: "bundle")
        assert(path != nil)
        let loadingBundle = Bundle(path: path!)
        let paths = try? FileManager.default.contentsOfDirectory(atPath: path!)
        assert(paths != nil)
        var images: Array<UIImage> = []
        for p in paths! {
            images.append(UIImage(named: p, in: loadingBundle, compatibleWith: nil)!)
        }
        return images
    }
    
    private var loadingView: RSLoadingView!
    private var targetView: UIView?
    
    static let shared = HUDTool()
    //This prevents others from using the default '()' initializer for this class.
    init() {
        loadingView = RSLoadingView(effectType: RSLoadingView.Effect.spinAlone)
        loadingView.speedFactor = 3
        loadingView.sizeInContainer = CGSize(width: 120, height: 120)
    }
    
    func showLoading(on view: UIView? = nil) -> Void {
        targetView = view ?? UIApplication.shared.delegate?.window!
        loadingView.show(on: targetView!)
    }
    
    func hideLoading() -> Void {
        RSLoadingView.hide(from: targetView!)
    }
    
    func showActivity() -> Void {
        UIViewController.current.chrysan.show()
    }
    
    func hideActivity() -> Void {
        UIViewController.current.chrysan.hide()
    }
    
    class func show(msg: String, icon: String? = nil, view: UIView? = nil, completion: ((Bool) -> Void)? = nil) -> Void {
        let duration: TimeInterval = 0.25 + Double(msg.count) * 0.02
        UIViewController.current.chrysan.show(.plain, message: msg, hideDelay: duration)
    }
}
