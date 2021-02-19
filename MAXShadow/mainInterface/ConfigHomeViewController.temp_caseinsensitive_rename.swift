//
//  configHomeViewController.swift
//  MAXShadow
//
//  Created by 大鲨鱼 on 2018/8/15.
//  Copyright © 2018年 大鲨鱼. All rights reserved.
//

import UIKit

class ConfigHomeViewController: UIViewController {

    
    override func loadView() {
        let tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.dataSource = self as UITableViewDataSource
        tableView.delegate = self as UITableViewDelegate
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Configuration"
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = HexColor(hex: 0xF8F8FE, alpha: 1.0)
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.default, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate var dataList : [String] = {
        return ["Default","American"]
    }()
}
//TableView 相关
extension ConfigHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
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
        cell?.textLabel?.text = dataList[indexPath.row]
        cell?.textLabel?.textAlignment = NSTextAlignment.left
        return  cell!
    }
    
    //该方法是用来设置 TableView 有多少组 Cell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //设置每一行 cell 的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    //选中 cell 后的操作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) //取消选中的效果动画开
        if indexPath.row == 0 {
            print("打开邮件系统")
        }
    }
    
    
}
