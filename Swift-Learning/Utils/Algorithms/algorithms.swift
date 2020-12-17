//
//  algorithms.swift
//  Swift-Learning
//
//  Created by zhangdu_imac on 2020/11/3.
//  Copyright © 2020 xiang. All rights reserved.
//

import Foundation

/// 快速排序
/// - Parameter array: Int数组
/// - Returns: 结果数组
func quickSort(array: inout [Int], left: Int, right: Int) {
    if left >= right {
        return
    }
    var first = left, last = right
    let key = array[first]
    while first < last {
        while (first < last && array[last] >= key) {
            last -= 1
        }
        array[first] = array[last]
        while (first < last && array[first] <= key) {
            first += 1;
        }
        array[last] = array[first]
    }
    array[first] = key
    quickSort(array: &array, left: left, right: first - 1)
    quickSort(array: &array, left: first + 1, right: right)
}

/// 两数之和：给定一个整数数组nums和一个目标值target，在该数组中找出和为目标值的那两个整数，并返回他们的数组下标。
/// - Parameters:
///   - nums: 数组
///   - target: 目标值
/// - Returns: 下标数组
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var container = Set<Int>()
    for (index, value) in nums.enumerated() {
        let match = target - value
        if container.contains(match) {
            let secondIndex: Int = nums.firstIndex(of: match)!
            print([secondIndex, index])
            return [secondIndex, index]
        }
        container.insert(value)
    }
    return [Int]()
}


// MARK: 数组实现栈

protocol StackProtocol {
    associatedtype Element
    
    /// 元素总数
    var count: Int { get }
    
    /// 栈顶元素
    var topElemet: Element { get }
    
    var isEmpty: Bool{ get }
    
    /// 入栈
    /// - Parameter element: 元素
    mutating func pushStack(element: Element)
    
    /// 出栈
    /// - Parameter element: 元素
    mutating func popStack(element: Element) -> Element?
    
}

struct Stack: StackProtocol {
    
    typealias Element = Int
    
    var count: Int {
        return stack.count
    }
    
    var topElemet: Element {
        return stack.last!
    }
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
    
    var stack = [Element]()
    
    mutating func pushStack(element: Int) {
        stack.append(element)
    }
    
    mutating func popStack(element: Int) -> Int? {
        if isEmpty {
            return nil
        } else {
            return stack.popLast()
        }
    }
    
}
