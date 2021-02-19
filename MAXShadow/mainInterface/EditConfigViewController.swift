//
//  EditConfigViewController.swift
//  MAXShadow
//
//  Created by 大鲨鱼 on 2018/8/16.
//  Copyright © 2018年 大鲨鱼. All rights reserved.
//

import UIKit

class EditConfigViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var dataList = [["服务器","端口","密码","加密方法","备注"],["混淆","混淆参数","协议","协议参数"]]
    var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //当前页面标题、背景色、状态栏颜色
        self.title = "编辑配置"
        view.backgroundColor = HexColor(hex: 0xF8F8FE, alpha: 1.0)
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.default, animated: true)
        
        //导航栏右边操作按钮
        let rightBar = UIBarButtonItem.init(barButtonSystemItem: .save, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightBar
        
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
    }
    
    //设置每一行 cell 的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "addCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "addCell")
            cell?.selectionStyle = .none
        }
        let arr = dataList[indexPath.section] as Array
        cell?.textLabel?.text = arr[indexPath.row] as String
        return cell!
    }
    
    //MARK: 编辑模式，增加还是删除
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if indexPath.section == 1 {
            return .delete
        }
        return .insert
    }
    
    //MARK: 执行编辑操作时，调用此方法
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        var arr = dataList[indexPath.section] as Array
        if editingStyle == .insert {
            arr.insert("Apple Pay", at: indexPath.row)
            dataList[indexPath.section] = arr
            tableView.insertRows(at: [indexPath], with: .right)
        } else {
            arr.remove(at: indexPath.row)
            dataList[indexPath.section] = arr
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
}
