//
//  XPYHTTPManager.swift
//  Swift-Learning
//
//  Created by zhangdu_imac on 2019/5/27.
//  Copyright © 2019 xiang. All rights reserved.
//

import UIKit
import Alamofire

#if DEBUG
var baseServerURL = "testapp.zhangdu.com/v1"
#endif
public enum XPYNetworkStatus: Int {
    case networkStatusUnknown = 0        //未知网络
    case networkStatusNotReachable = 1   //网络未连接
    case networkStatusWWAN = 2           //3G、4G网络
    case networkStatusWiFi = 3           //WiFi网络
}
public enum XPYRequestMethod: Int {
    case requestMethodGet
    case requestMethodPost
}

typealias XPYResponceSuccess = (_ responce: AnyObject) -> Void              //接口访问成功闭包
typealias XPYResponceFailure = (_ error: AnyObject) -> Void                 //接口访问失败闭包
typealias XPYNetworkingStatus = (_ networkStatus: XPYNetworkStatus) -> Void //网络状况闭包

class XPYHTTPManager: NSObject {
    private var sharedInstance = XPYHTTPManager()
    private override init() {
    }
    private lazy var manager: SessionManager = {
        let sessionConfig: URLSessionConfiguration = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 30
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            baseServerURL: .disableEvaluation
        ]
        return SessionManager(configuration: sessionConfig, delegate: SessionDelegate(), serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies))
    }()
}
