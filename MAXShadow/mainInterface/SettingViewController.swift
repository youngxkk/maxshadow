//
//  SettingViewController.swift
//  MAXShadow
//
//  Created by 大鲨鱼 on 2018/8/15.
//  Copyright © 2018年 大鲨鱼. All rights reserved.
//

import Foundation

import UIKit

class SettingViewController: UIViewController {
    
    // tableView 的数据，设置的各项功能
    var dataList = [["Feedback","Rate Us"],["Invite Friends","About Us"]]
    let version:UILabel = UILabel()
    
    override func loadView() {

        let tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
        tableView.dataSource = self as UITableViewDataSource
        tableView.delegate = self as UITableViewDelegate
        view = tableView
        
        version.text = "Version 1.0"
        version.font = UIFont(name: "DIN-Medium", size: 12)
        version.textColor = UIColor.gray
        version.textAlignment = .center
        version.frame.size = CGSize(width: view.bounds.width, height: 30)
        version.center.y = view.bounds.height * 0.86
        view.addSubview(version)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = HexColor(hex: 0xF8F8FE, alpha: 1.0)
        navigationItem.title = "Setting"
        navigationController?.navigationBar.isHidden = false
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.default, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //跳转到关于页面
    @objc func goaboutus() {
        let goAboutUs = AboutUsViewController()
        self.navigationController?.pushViewController(goAboutUs, animated: true)
    }
    //弹出反馈邮件界面
    @objc func feedback() {
        let sendMailHelper = SendMailHelper()
        let viewController = sendMailHelper.basicConfigAndShowMail(recipients: ["maxwallpaperapp@gmail.com"], subject: "home_feedback_mail_subject", messageBody: "")
        if let vc = viewController {
            sendMailHelper.setCcRecipients([""])
            self.present(vc, animated: true, completion: {})
        }
    }
    //弹出系统的分享功能，分享到第三方
    @objc func inviteFriends() {
        func share() -> Void {
            let title: String = "home_share_app_title"
            let img = UIImage(named: "icon-60@3x.png")
            let imageView = UIImageView(image: img)
            let url: NSURL = NSURL(string: "https://itunes.apple.com/cn/app/id1420435738")! // 已替换成自己的appid
            let items: Array = [title, imageView, url] as [Any]
            let vc = UIActivityViewController(activityItems: items, applicationActivities: nil)
            vc.completionWithItemsHandler = { (activityType: UIActivityType?, completed: Bool, returnedItems: [Any]?, activityError: Error?) in
                log.info("share app"+(completed ? "success" : "failed"))
                vc.dismiss(animated: true, completion: {})
            }
            self.present(vc, animated: true) {}
        }
        share()
    }
    //弹出评价的弹窗
    @objc func rateUs() {
        APPStoreReview.showReview()
    }

}

//TableView 相关
extension SettingViewController: UITableViewDataSource, UITableViewDelegate {
    
    //返回每一个 section 有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count;
    }
    
    //返回cell 显示的内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellIdentifier")
        }
        
        let arr = dataList[indexPath.section]
        cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell?.textLabel?.text = arr[indexPath.row]
        cell?.textLabel?.textAlignment = NSTextAlignment.left
        return  cell!
    }

    //头部高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    //该方法是用来设置 TableView 有多少组 Cell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    //设置每一行 cell 的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    //选中 cell 后的操作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) //取消选中的效果动画开
        if indexPath.row == 0 {
            print("打开邮件系统")
            feedback()
        }else if indexPath.row == 1 {
            print("弹窗评价弹窗")
            rateUs()
        }else if indexPath.row == 2 {
            print("打开系统的第三方分享")
            inviteFriends()
        }else if indexPath.row == 3 {
            print("去关于页面")
            goaboutus()
        }
    }
    
    //文本和分割线的左右上下间距
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 20) //控制线的左右间距
        cell.layoutMargins = UIEdgeInsets.init(top: 0, left: 30, bottom: 0, right: 0) //控制文本的左右间距
    }
    
    
}
