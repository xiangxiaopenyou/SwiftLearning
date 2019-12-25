//
//  XPYHomepageTableViewCell.swift
//  Swift-Learning
//
//  Created by zhangdu_imac on 2019/12/11.
//  Copyright © 2019 xiang. All rights reserved.
//

import UIKit
import SnapKit

class XPYHomepageTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Lazy load
    lazy public var nameLabel: UILabel = {
        let name = UILabel.init()
        name.textColor = UIColor.black
        name.font = UIFont.systemFont(ofSize: 14)
        name.text = "名字"
        return name
    }()
}

//MARK: UI
extension XPYHomepageTableViewCell {
    func setupContentView() {
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView.snp_leading).offset(20)
            make.centerY.equalTo(contentView)
        }
    }
}
