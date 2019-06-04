//
//  ViewController.swift
//  Swift-Learning
//
//  Created by zhangdu_imac on 2019/3/4.
//  Copyright © 2019 xiang. All rights reserved.
//

import UIKit

class XPYViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.backgroundColor = UIColor.green
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight = 50
        
        self.loadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if (UserDefaults.standard.string(forKey: "XPYUserID") == nil) {
            let loginController = UIStoryboard.init(name: "XPYLogin", bundle: nil).instantiateViewController(withIdentifier: "XPYLoginController")
            self.present(loginController, animated: true, completion: nil)
        }
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
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if (cell == nil) {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell?.backgroundColor = UIColor.red
        return cell!
    }
}

//MARK: Table view delegate
extension XPYViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        NSLog("点击了列表");
    }
}

