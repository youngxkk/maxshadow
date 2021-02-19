//
//  AboutUsViewController.swift
//  MAXShadow
//
//  Created by 大鲨鱼 on 2018/8/15.
//  Copyright © 2018年 大鲨鱼. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {
    let aboutus:UILabel = UILabel()
    let setTitle:UILabel = UILabel()
    let closeBtn:UIButton = UIButton()
    let image:UIImage = UIImage(named: "max_logo")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "About Us"
        view.backgroundColor = HexColor(hex: 0xF8F8FE, alpha: 1.0)
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.default, animated: true)

        closeBtn.frame.size = CGSize(width: 39, height: 39)
        closeBtn.setBackgroundImage(UIImage(named: "navi_close"), for: .normal)
        closeBtn.adjustsImageWhenHighlighted = false
        //        view.addSubview(closeBtn)
        
        setTitle.text = "About Us"
        setTitle.font = UIFont(name: "DINCond-Black", size: 24)
        setTitle.textColor = UIColor.white
        setTitle.textAlignment = .center
        setTitle.frame.size = CGSize(width: view.bounds.width, height: 64)
        setTitle.center.y = 10
        //        view.addSubview(setTitle)
        
        let logo = UIImageView(image: image)
        logo.frame.size = CGSize(width: 100, height: 40)
        logo.center.x = view.bounds.width / 2
        logo.center.y = view.bounds.height / 2.8
        view.addSubview(logo)
        
        aboutus.text = "MAX Studio is Very Cool"
        aboutus.font = UIFont(name: "DINCond-Black", size: 20)
        aboutus.textColor = UIColor.black
        aboutus.textAlignment = .center
        aboutus.frame.size = CGSize(width: view.bounds.width, height: 40)
        aboutus.center.y = view.bounds.height / 2.4
        view.addSubview(aboutus)
    }
}
