//
//  XPYMineTableViewCell.swift
//  Swift-Learning
//
//  Created by zhangdu_imac on 2020/5/13.
//  Copyright © 2020 xiang. All rights reserved.
//

import UIKit

class XPYMineTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    // MARK: UI
    func configureUI() {
        textLabel?.textColor = UIColor.red
        textLabel?.font = UIFont.systemFont(ofSize: 16)
    }
    
    public func setupTitle(titleString: String) {
        textLabel?.text = titleString
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
