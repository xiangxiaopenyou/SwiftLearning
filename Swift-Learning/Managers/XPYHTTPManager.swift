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
private var baseServerURL = "testapp.zhangdu.com/v1"
#else
private var baseServerURL = "app.zhangdu.com/v1"
#endif

public enum XPYNetworkStatus: Int {
    case networkStatusUnknown        //未知网络
    case networkStatusNotReachable   //网络未连接
    case networkStatusWWAN           //3G、4G网络
    case networkStatusWiFi           //WiFi网络
}
public enum XPYRequestMethod: Int {
    case requestMethodGet
    case requestMethodPost
}

typealias XPYResponceSuccess = (_ responce: AnyObject) -> Void              //接口访问成功闭包
typealias XPYResponceFailure = (_ error: AnyObject) -> Void                 //接口访问失败闭包
typealias XPYNetworkingStatus = (_ networkStatus: XPYNetworkStatus) -> Void //网络状况闭包

class XPYHTTPManager: NSObject {
    static let sharedInstance = XPYHTTPManager()
//    private override init() {
//    }
    private lazy var manager: SessionManager = {
        let sessionConfig: URLSessionConfiguration = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 30
        sessionConfig.httpAdditionalHeaders = xpyHttpHeaders
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            //正式环境证书配置
            //baseServerURL: .pinCertificates(certificates: ServerTrustPolicy.certificates(), validateCertificateChain: true, validateHost: true),
            //测试环境不需要验证
            baseServerURL: .disableEvaluation
        ]
        return SessionManager(configuration: sessionConfig, delegate: SessionDelegate(), serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies))
    }()
    
    //根据需要切换baseURL
    //private var xpyBaseURL = baseServerURL
    
    //请求头设置
    private var xpyHttpHeaders: [String: String]? {
//        return ["content-type" : "application/json", "Accept" : "text/html; charset=UTF-8"]
        guard let token = UserDefaults.standard.string(forKey: "UserToken") else { return nil }
        return ["token": token]
    }
    
    //当前网络状态
    private var xpyNetworkStatus: XPYNetworkStatus = XPYNetworkStatus.networkStatusWiFi
    
    public func getWith(url: String, params: [String: Any]?, success: @escaping XPYResponceSuccess, failure: @escaping XPYResponceFailure) {
        requestWith(url: url, method: XPYRequestMethod.requestMethodGet, params: params, success: success, failure: failure)
    }
    public func postWith(url: String, params: [String: Any], success: @escaping XPYResponceSuccess, failure: @escaping XPYResponceFailure) {
        requestWith(url: url, method: XPYRequestMethod.requestMethodPost, params: params, success: success, failure: failure)
    }
    
    //请求方法
    public func requestWith(url: String,
                            method: XPYRequestMethod,
                            params: [String: Any]?,
                            success: @escaping XPYResponceSuccess,
                            failure: @escaping XPYResponceFailure) {
        if (url.isEmpty) {
            print("URL为空")
            return
        }
        let urlString = absoluteURLStringWithPath(path: url)
        if method == XPYRequestMethod.requestMethodGet {    //GET
            getRequestWith(url: urlString, params: params, success: success, failure: failure)
        } else {                                            //POST
            postRequestWith(url: urlString, params: params, success: success, failure: failure)
        }
    }
    
    //GET请求
    private func getRequestWith(url: String, params: [String: Any]?, success: @escaping XPYResponceSuccess, failure: @escaping XPYResponceFailure) {
        
        
        manager.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            print(response.request!)    // original URL request
            print(response.response!) // HTTP URL response
            print(response.data!)          // server data
            print(response.result)          // result of response serialization
            switch response.result {
            case .success:
                if let result = response.result.value as? [String: Any] {
                    if result["status"] as? Int == 200 {
                        success(result as AnyObject)
                    }
                }
            case .failure(let err):
                failure(err as AnyObject)
                debugPrint(err)
            }
        }
    }
    
    //POST请求
    private func postRequestWith(url: String, params: [String : Any]?, success: @escaping XPYResponceSuccess, failure: @escaping XPYResponceFailure) {
        manager.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success:
                if let result = response.result.value as? [String: Any] {
                    if result["status"] as? Int == 200 {
                        success(result as AnyObject)
                    }
                }
            case .failure(let err):
                failure(err as AnyObject)
                debugPrint(err)
            }
        }
    }
}

// MARK: 网络状态变化
extension XPYHTTPManager {
    public func networkingStatus(status: @escaping XPYNetworkingStatus) {
        let reachabilityManager = NetworkReachabilityManager()
        reachabilityManager?.startListening()
        reachabilityManager?.listener = { [weak self] state in
            guard let weakSelf = self else { return }
            if reachabilityManager?.isReachable ?? false {
                switch state {
                case .notReachable:
                    weakSelf.xpyNetworkStatus = XPYNetworkStatus.networkStatusNotReachable
                case .unknown:
                    weakSelf.xpyNetworkStatus = XPYNetworkStatus.networkStatusUnknown
                case .reachable(.wwan):
                    weakSelf.xpyNetworkStatus = XPYNetworkStatus.networkStatusWWAN
                case .reachable(.ethernetOrWiFi):
                    weakSelf.xpyNetworkStatus = XPYNetworkStatus.networkStatusWiFi
                }
            } else {
                weakSelf.xpyNetworkStatus = XPYNetworkStatus.networkStatusNotReachable
            }
            status(weakSelf.xpyNetworkStatus)
        }
    }
}

//MARK: 获取完整请求链接
extension XPYHTTPManager {
    func absoluteURLStringWithPath(path: String) -> String {
        var baseURLString: String! = baseServerURL
        var needHTTPS = false
        #if DEBUG
        needHTTPS = false
        #else
        needHTTPS = true
        #endif
        
        baseURLString = needHTTPS ? "https://" : "http://" + baseURLString + path
        
        let userId = UserDefaults.standard.string(forKey: "UserId")
        let userToken = UserDefaults.standard.string(forKey:"UserToken")
        if userId != nil && userToken != nil {
            baseURLString = baseURLString + "?user_id=" + UserDefaults.standard.string(forKey: "UserId")! + "&user_token=" + UserDefaults.standard.string(forKey: "UserToken")!
        } else {
            baseURLString = baseURLString + "?user_id=0&user_token=0"
        }
        //let uuid = UUID().uuidString
        
        
        if let channelId = UserDefaults.standard.string(forKey: "ChannelId") {
            baseURLString = baseURLString + "&channelid=" + channelId
        }
        baseURLString = baseURLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        return baseURLString
    }
    
}



