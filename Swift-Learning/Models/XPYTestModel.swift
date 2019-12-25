//
//  XPYTestModel.swift
//  Swift-Learning
//
//  Created by zhangdu_imac on 2019/12/24.
//  Copyright © 2019 xiang. All rights reserved.
//

import UIKit
import ObjectMapper

class XPYTestModel: Mappable {
    var testTitle: String?
    var dataList: Array<XPYTestSubModel>?
    required init?(map: Map) {

    }
    
    func mapping(map: Map) {
        testTitle <- map["title"]
        dataList <- map["datalist"]
    }
}

class XPYTestSubModel: Mappable {
    var typeId: String?
    var typeName: String?
    var pic: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        typeId <- map["type_id"]
        typeName <- map["typename"]
        pic <- map["pic"]
    }
}

