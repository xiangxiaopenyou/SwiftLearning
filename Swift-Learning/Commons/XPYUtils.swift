//
//  XPYUtils.swift
//  Swift-Learning
//
//  Created by zhangdu_imac on 2019/5/27.
//  Copyright © 2019 xiang. All rights reserved.
//

import UIKit

class XPYUtils: NSObject {
    
    /// 判断手机号格式
    /// - Parameter numberString: numberString
    class func isPhoneNumber(_ numberString: NSString!) -> Bool {
        let phonePredicate = NSPredicate.init(format: "SELF MATCHES %@", "^1[0-9]{10}$")
        if phonePredicate.evaluate(with: numberString) {
            return true
        }
        return false
    }
    
    /// object判空
    /// - Parameter object: object
    class func isNullObject(_ object: AnyObject) -> Bool {
        if (object.count <= 0) {
            return true
        }
        return false;
    }
    
    /// 根据Hex字符串和透明度获取UIColor
    /// - Parameters:
    ///   - hexString: Hex字符串
    ///   - alpha: 透明度
    class func colorFromHexStringWithAlpha(hexString: String, alpha: CGFloat) -> UIColor {
        var targetString = hexString
        guard targetString.count >= 6 else {
            return UIColor.clear
        }
        targetString = String(targetString.suffix(6))
        let redString = String(targetString.prefix(2))
        let greenString = String(targetString[targetString.index(targetString.startIndex, offsetBy: 2) ..< targetString.index(targetString.startIndex, offsetBy: 4)])
        let blueString = String(targetString[targetString.index(targetString.startIndex, offsetBy: 4) ..< targetString.index(targetString.startIndex, offsetBy: 6)])
        
        var red: UInt32 = 0
        var green: UInt32 = 0
        var blue: UInt32 = 0
        
        Scanner(string: redString).scanHexInt32(&red)
        Scanner(string: greenString).scanHexInt32(&green)
        Scanner(string: blueString).scanHexInt32(&blue)
        
        let resultColor = UIColor.init(red: (CGFloat)(red) / 255.0, green: (CGFloat)(green) / 255.0, blue: (CGFloat)(blue) / 255.0, alpha: alpha)
        
        return resultColor
    }
    class func colorFromHexString(hexString: String) -> UIColor {
        return colorFromHexStringWithAlpha(hexString: hexString, alpha: 1)
    }
}
