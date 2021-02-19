//
//  HomeViewController.swift
//  MAXShadow
//
//  Created by 大鲨鱼 on 2018/8/15.
//  Copyright © 2018年 大鲨鱼. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    
    
//    let img = UIImage(named: "max2")
    let setButton = UIButton()
    let switchBtn = UIButton()
    let configBtn = UIButton()
    
    let randomCount = Int(arc4random()%10) + 1
    let img = UIImage(named: "max5")

 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //主页隐藏导航栏
        navigationController?.navigationBar.isHidden = true
//        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)
        
        //定义卡片的宽
        let cardWidth:CGFloat = self.view.bounds.width - 30

       
        
        //主页背景图
        let imageView = UIImageView(image: img)
        imageView.frame.size = CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
        imageView.contentMode = .scaleAspectFill
        self.view.insertSubview(imageView, at: 0)
        
        //主页左上角title标题
        let title:UILabel = UILabel()
        title.text = "MAXShadow"
        title.textColor = UIColor.white
        title.font = UIFont(name: "DIN-Medium", size: 40)
        title.textAlignment = .left
        title.frame = CGRect(x: 20, y: self.view.bounds.height * 0.08, width: 250, height: 50)
        self.view.addSubview(title)
        
        //主页右上角设置按钮
        setButton.frame = CGRect(x: self.view.bounds.width - 60, y: self.view.bounds.height * 0.087, width: 45, height: 45)
        setButton.setImage(UIImage(named: "ic_setting"), for: .normal)
        setButton.addTarget(self, action: #selector(goSettingView), for: .touchUpInside)
        self.view.addSubview(setButton)
        
        
        //分割线的样式及位置
        let lineView = UIView()
        lineView.center.x = 35
        lineView.center.y = self.view.bounds.height - (cardWidth * 0.9) + 45
        lineView.frame.size = CGSize(width: cardWidth * 0.9, height: 1)
        lineView.backgroundColor = HexColor(hex: 0x1A1839, alpha: 0.1)
        self.view.insertSubview(lineView, at: 5)
        
        
        //去配置详情的 button 相关
        configBtn.center.x = 15
        configBtn.center.y = self.view.bounds.height - (cardWidth * 0.9) - 15
        configBtn.setImage(UIImage(named: "ic_arrow"), for: .normal)
        configBtn.frame.size = CGSize(width: cardWidth, height: 60)
        configBtn.setTitle("Default", for: .normal)
        configBtn.setTitleColor(UIColor.black, for: .normal)
        configBtn.titleLabel?.font = UIFont(name: "DIN-Medium", size: 17)
        configBtn.layer.cornerRadius = 8
        configBtn.layer.masksToBounds = true
        configBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0 , 0, cardWidth * 0.76)
        configBtn.imageEdgeInsets = UIEdgeInsetsMake(0, cardWidth * 0.9, 0, 0)
        configBtn.backgroundColor = UIColor.clear
        configBtn.addTarget(self, action: #selector(goConfigView), for: .touchUpInside)
        self.view.insertSubview(configBtn, at: 4)
        
        //主页最大的开关
        switchBtn.setImage(UIImage(named: "switch_off"), for: .normal)
        switchBtn.setImage(UIImage(named: "switch_on"), for: .selected)
        switchBtn.frame.size = CGSize(width: 200, height: 200)
        switchBtn.center.x = self.view.bounds.width / 2
        switchBtn.center.y = self.view.bounds.height - 135
//        switchBtn.addTarget(self, action: #selector(changeBG()), for: .touchUpInside)
        self.view.insertSubview(switchBtn, at: 3)
        
        //高斯模糊上面一层白色
        let whiteView = UIView()
        whiteView.backgroundColor = HexColor(hex: 0xffffff, alpha: 0.75)
        whiteView.layer.cornerRadius = 8
        whiteView.frame = CGRect(x: 15, y: self.view.bounds.height - (cardWidth * 0.9) - 15, width: cardWidth, height: cardWidth * 0.9)
        self.view.insertSubview(whiteView, at: 2)
        
        //使用系统的高斯模糊
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = CGRect(x: 15, y: self.view.bounds.height - (cardWidth * 0.9) - 15, width: cardWidth, height: cardWidth * 0.9)
        self.view.insertSubview(blurView, at: 1)
        
        //更改图层的顺序
//        self.view.bringSubview(toFront: configBtn)
//        self.view.bringSubview(toFront: switchBtn) //将开关按钮放到最上方
//        self.view.sendSubview(toBack: blurView) //将模糊图层设置为最下方
//        self.view.exchangeSubview(at: 1, withSubviewAt: 2)  //互换图层顺序
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //可以解决从下一个页面回来后导航栏出现的 bug
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    @objc func goSettingView(){
        let setVC = SettingViewController()
        self.navigationController?.pushViewController(setVC, animated: true)
    }
    @objc func goConfigView(){
        let goConfigVC = ConfigHomeViewController()
        self.navigationController?.pushViewController(goConfigVC, animated: true)
    }
    
    
}
