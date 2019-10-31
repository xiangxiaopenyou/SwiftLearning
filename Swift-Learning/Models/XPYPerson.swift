//
//  XPYPerson.swift
//  Swift-Learning
//
//  Created by zhangdu_imac on 2019/9/17.
//  Copyright © 2019 xiang. All rights reserved.
//

import UIKit

enum XPYPosition: Int {
    case positionUp
    case positionDown
    case positionLeft
    case positionRight
}

struct XPYStudent {
    var number: Int
    var name: String
    
    func learn() {
        
    }
}
typealias PersonHeight = Float     //身高
typealias PersonWeight = (_ weight: Float) -> Void  //体重闭包

//protocol changeHeight {
//    func didChangeHeight(height: Float)
//}
//protocol changeWeight {
//    func didChangeWeight(weight: Float)
//}
////组合两个protocol
//typealias changeProtocol = changeHeight & changeWeight
//
//class XPYPerson: NSObject, changeProtocol {
//    //实现protocol方法
//    func didChangeHeight(height: Float) {
//        <#code#>
//    }
//    func didChangeWeight(weight: Float) {
//        <#code#>
//    }
//}

class XPYPerson: NSObject {
    var name = "XLp"
}
// MARK: - XPYPerson添加方法
extension XPYPerson {
    func run() {
        print("添加run方法")
    }
}
// MARK: - 添加时间计算属性
extension Int {
    var second: Int {
        return self
    }
    var minute: Int {
        return self * 60
    }
    var hour: Int {
        return self * 3600
    }
}

//
//class XPYPerson: NSObject {
//    let name = "XLp"
//    var age = 26
//    //final修饰属性
//    final var job = "programmer"
//    class func eat() {
//        print("吃东西")
//    }
//    func sleep() {
//        print("睡觉")
//    }
//    //final声明方法
//    final func run () {
//        print("跑步")
//    }
//}
//
////final声明类
//final class XPYPeople: XPYPerson {
//    func walk(){
//    }
//}
////错误提示：Inheritance from a final class 'XPYPeople'
////class XPYboy: XPYPeople {
////
////}
//
//class XPYSomeone: XPYPerson {
//    //错误提示：Cannot override with a stored property 'job'
//    //override var job = ""
//    override func sleep() {
//
//    }
//    //错提示误：Instance method overrides a 'final' instance method
//    //override func run() {
//    //
//    //}
//}

