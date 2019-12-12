//
//  ViewController.swift
//  Swift-Learning
//
//  Created by zhangdu_imac on 2019/3/4.
//  Copyright © 2019 xiang. All rights reserved.
//

import UIKit

let kXPYHomepageTableViewCellIdentifier = "XPYHomepageTableViewCellIdentifier"


class XPYViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
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
        
        tableView.backgroundColor = UIColor.green
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight = 50
        self.title = "分类"
        self.loadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func loadData() {
        
    }
}

//MARK: Table view data source
extension XPYViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: kXPYHomepageTableViewCellIdentifier)
        if (cell == nil) {
            cell = XPYHomepageTableViewCell(style: .default, reuseIdentifier: kXPYHomepageTableViewCellIdentifier)
        }
        return cell!
    }
}

//MARK: Table view delegate
extension XPYViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        print("点击了列表")
    }
}

