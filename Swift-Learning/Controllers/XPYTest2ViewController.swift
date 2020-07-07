//
//  XPYTest2ViewController.swift
//  Swift-Learning
//
//  Created by zhangdu_imac on 2019/10/30.
//  Copyright © 2019 xiang. All rights reserved.
//

import UIKit

protocol XPYTest2ViewControllerProtocol {
    func test2DidPop()
}

class XPYTest2ViewController: UIViewController {
    
    var delegate: XPYTest2ViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let delegate = self.delegate {
            delegate.test2DidPop()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
