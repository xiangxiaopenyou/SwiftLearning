//
//  XPYTestViewController.swift
//  Swift-Learning
//
//  Created by zhangdu_imac on 2019/10/30.
//  Copyright © 2019 xiang. All rights reserved.
//

import UIKit

class XPYTestViewController: UIViewController {
    
    var pushButton: UIButton = {
        var pushButton = UIButton.init(type: .custom)
        pushButton.setTitle("Push", for: .normal)
        pushButton.setTitleColor(.red, for: .normal)
        pushButton.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        pushButton.addTarget(self, action: #selector(pushAction), for: .touchUpInside)
        return pushButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(pushButton)
    }
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        print("tap")
    }
    @objc func pushAction() {
        let pushController = XPYTest2ViewController.init()
        pushController.hidesBottomBarWhenPushed = true
        pushController.delegate = self
        navigationController?.pushViewController(pushController, animated: true)
    }

}

extension XPYTestViewController: XPYTest2ViewControllerProtocol {
    func test2DidPop() {
        print("pop");
    }
}
