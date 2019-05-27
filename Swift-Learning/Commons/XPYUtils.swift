//
//  XPYUtils.swift
//  Swift-Learning
//
//  Created by zhangdu_imac on 2019/5/27.
//  Copyright © 2019 xiang. All rights reserved.
//

import UIKit

//MARK: 判断手机号格式
class XPYUtils: NSObject {
    class func isPhoneNumber(_ numberString: NSString!) -> Bool {
        let phonePredicate = NSPredicate.init(format: "SELF MATCHES %@", "^1[0-9]{10}$")
        if phonePredicate.evaluate(with: numberString) {
            return true
        }
        return false
    }
}
