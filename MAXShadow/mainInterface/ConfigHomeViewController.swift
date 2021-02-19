//
//  ConfigHomeViewController.swift
//  MAXShadow
//
//  Created by 大鲨鱼 on 2018/8/15.
//  Copyright © 2018年 大鲨鱼. All rights reserved.
//

import UIKit

class ConfigHomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var dataList = [["default"," American"],["Japan","England"]]
    
    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //当前页面标题、背景色、状态栏颜色
        self.title = "选择配置"
        view.backgroundColor = HexColor(hex: 0xF8F8FE, alpha: 1.0)
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.default, animated: true)

        //导航栏右边操作按钮
        let rightBar = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addButtonClick))
        navigationItem.rightBarButtonItem = rightBar
        
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
    }
    
    //MARK: 导航栏右侧按钮，点击开启或关闭编辑模式
    @objc func editButtonClick() {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    //执行添加操作，跳转到编辑配置界面
    @objc func addButtonClick() {
        goEditConfig()
    }
    
    //设置每一行 cell 的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    //返回多少组 这个页面是2组
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count
    }
    
    //返回每一行的数据
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList[section].count
    }
    
    //返回cell 显示的内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "addCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "addCell")
            cell?.selectionStyle = .none
        }
        let arr = dataList[indexPath.section] as Array
        cell?.textLabel?.text = arr[indexPath.row] as String
        cell?.accessoryType = UITableViewCellAccessoryType.detailButton //右边有蓝色的圆形button
        return cell!
    }
    
    //MARK: 编辑模式，增加还是删除
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
//        if indexPath.section == 0 {
//            return .delete
//        }
        return .delete
    }
    
    //MARK: 执行编辑操作时，调用此方法
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        var arr = dataList[indexPath.section] as Array
        if editingStyle == .delete {
            arr.remove(at: indexPath.row)
            dataList[indexPath.section] = arr
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }

    //点击 cell 右侧的蓝色圆形 button 进入编辑详情
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) //取消选中的效果动画开
        if indexPath.row == 0 {
            print("跳转页面")
            goEditConfig()
        }else if indexPath.row == 1 {
            goEditConfig()
        }
    }
    
    //点击后跳转到配置的界面
    func goEditConfig() {
        let goEditConfig = EditConfigViewController()
        self.navigationController?.pushViewController(goEditConfig, animated: true)
    }
    
}


