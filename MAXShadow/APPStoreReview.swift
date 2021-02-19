//
//  APPStoreReview.swift
//  MAXShadow
//
//  Created by 大鲨鱼 on 2018/8/15.
//  Copyright © 2018年 大鲨鱼. All rights reserved.
//

import Foundation
import UIKit
import StoreKit

class APPStoreReview: NSObject {
    class func showReview() -> Void {
        if #available(iOS 10.3, *) {
            UIApplication.shared.keyWindow?.endEditing(true)
            SKStoreReviewController.requestReview()
        } else {
            let appid = "156093462" // TODO:
            let url = "itms-apps://itunes.apple.com/app/id\(appid)?action=write-review"
            UIApplication.shared.openURL(URL(string: url)!)
        }
    }
}
