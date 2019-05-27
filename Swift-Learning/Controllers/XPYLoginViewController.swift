//
//  XPYLoginViewController.swift
//  Swift-Learning
//
//  Created by zhangdu_imac on 2019/5/24.
//  Copyright © 2019 xiang. All rights reserved.
//

import UIKit

class XPYLoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    typealias loginBlock = (_ isLogin: Bool, _ resultString: String) ->()
    
    var loginResult: loginBlock!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        print("点击了登录")
        if (XPYUtils.isPhoneNumber(usernameTextField.text as NSString?)  == false) {
            return
        }
        if (loginResult != nil) {
            loginResult(true, "xianglinping")
        }
        UserDefaults.standard.set(usernameTextField.text, forKey: "XPYUserID")
        UserDefaults.standard.synchronize()
        self.dismiss(animated: true, completion: nil)
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
