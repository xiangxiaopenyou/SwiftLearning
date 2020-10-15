//
//  ViewController.swift
//  Swift-Learning
//
//  Created by zhangdu_imac on 2019/3/4.
//  Copyright © 2019 xiang. All rights reserved.
//

import UIKit
import ObjectMapper

private let kXPYHomepageTableViewCellIdentifier = "XPYHomepageTableViewCellIdentifier"

class XPYViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    //var dataList: Array<XPYTestModel>! = []
    private let dataList = ["抽奖"]
    
//    lazy var mainTableView: UITableView? = {
//        let tempTableView = UITableView(frame: CGRect.zero, style: .plain)
//        tempTableView.delegate = self
//        tempTableView.dataSource = self
//        tempTableView.backgroundColor = UIColor.white
//        return tempTableView
//    }()
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "主页"
        //self.loadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func loadData() {
        //网络请求测试
        let params = ["action" : "class", "dir" : "1"] as [String : Any]
        XPYHTTPManager.sharedInstance.getWith(url: "/book", params: params, success: { (response) in
            //self.dataList = Mapper<XPYTestModel>().mapArray(JSONObject: response["data"] as Any?)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }) { (error) in
            
        }
    }
}

//MARK: Table view data source
extension XPYViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        //return dataList.count
        // return self.dataList.count
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
        //let testModel: XPYTestModel = self.dataList[section]
        //return testModel.dataList!.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: XPYHomepageTableViewCell? = tableView.dequeueReusableCell(withIdentifier: kXPYHomepageTableViewCellIdentifier) as? XPYHomepageTableViewCell
        if (cell == nil) {
            cell = XPYHomepageTableViewCell(style: .default, reuseIdentifier: kXPYHomepageTableViewCellIdentifier)
        }
        //colorWithHexString测试
        //cell?.backgroundColor = XPYUtils.colorWithHexString(hexString: "0x000000", alpha: 1)
//        let testModel: XPYTestModel = self.dataList[indexPath.section]
//        let testSubModel: XPYTestSubModel = testModel.dataList![indexPath.row]
        
        cell!.nameLabel.text = dataList[indexPath.row]
        return cell!
    }
}

//MARK: Table view delegate
extension XPYViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        print("点击了列表")
        let lotteryController = XPYLotteryViewController.init()
        navigationController?.pushViewController(lotteryController, animated: true)
    }
}

