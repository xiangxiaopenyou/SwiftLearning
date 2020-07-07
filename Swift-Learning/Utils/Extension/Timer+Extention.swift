//
//  Timer+Extention.swift
//  Swift-Learning
//
//  Created by zhangdu_imac on 2020/7/7.
//  Copyright © 2020 xiang. All rights reserved.
//

import Foundation
import UIKit

public typealias XPYTimerHandler = (Timer) -> Void

public extension Timer {
    class func xpy_timer(_ interval: TimeInterval, _ repeats: Bool, _ handler: @escaping XPYTimerHandler) -> Timer {
//        if #available(iOS 10.0, *) {
//            return Timer(timeInterval: interval, repeats: repeats, block: handler)
//        }
        return Timer(timeInterval: interval, target: self, selector: #selector(xpy_timerAction(_:)), userInfo: handler, repeats: repeats)
    }
    class func xpy_scheduledTimer(_ interval: TimeInterval, _ repeats: Bool, _ handler: @escaping XPYTimerHandler) -> Timer {
        if #available(iOS 10.0, *) {
            return Timer.scheduledTimer(withTimeInterval: interval, repeats: repeats, block: handler)
        }
        return Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(xpy_timerAction(_:)), userInfo: handler, repeats: repeats)
    }
    
    @objc class func xpy_timerAction(_ sender: Timer) {
        if let timerHander = sender.userInfo as? XPYTimerHandler {
            timerHander(sender)
        }
    }
}
