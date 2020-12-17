//
//  MineHomepageViewController.swift
//  Swift-Learning
//
//  Created by zhangdu_imac on 2020/10/15.
//  Copyright © 2020 xiang. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class MineHomepageViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tempTableView = UITableView.init(frame: .zero, style: .plain)
        tempTableView.rowHeight = 50;
        return tempTableView
    }()
    
    let disposeBag = DisposeBag()
    let dataSource = Observable<Array>.just(["头像", "个人信息", "设置"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(XPYMineTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(XPYMineTableViewCell.self))
        
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        // 绑定数据源
        dataSource.bind(to: tableView.rx.items(cellIdentifier: NSStringFromClass(XPYMineTableViewCell.self), cellType: XPYMineTableViewCell.self)) { (row, item, cell: XPYMineTableViewCell) in
            cell.setupTitle(titleString: item)
        }.disposed(by: disposeBag)
        
        // cell点击
        tableView.rx.modelSelected(String.self).subscribe(onNext: { item in
            print("select item:\(item)")
        }).disposed(by: disposeBag)
    }

}
