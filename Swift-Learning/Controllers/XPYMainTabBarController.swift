//
//  XPYMainTabBarController.swift
//  Swift-Learning
//
//  Created by zhangdu_imac on 2019/6/24.
//  Copyright © 2019 xiang. All rights reserved.
//

import UIKit

class XPYMainTabBarController: UITabBarController {
    override func viewDidLoad() {

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaults.standard.string(forKey: "XPYUserID") == nil {
            let loginController = UIStoryboard.init(name: "XPYLogin", bundle: nil).instantiateViewController(withIdentifier: "XPYLoginController")
            self.present(loginController, animated: true, completion: nil)
        }
    }
}
