//
//  XPYNavigationViewController.swift
//  Swift-Learning
//
//  Created by zhangdu_imac on 2020/7/1.
//  Copyright © 2020 xiang. All rights reserved.
//

import UIKit

class XPYNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    /// 拦截控制器
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            // 统一设置隐藏底部tabbar
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
        
    }

}
