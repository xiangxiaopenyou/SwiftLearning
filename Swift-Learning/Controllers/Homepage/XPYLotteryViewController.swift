//
//  XPYLotteryViewController.swift
//  Swift-Learning
//
//  Created by zhangdu_imac on 2020/7/1.
//  Copyright © 2020 xiang. All rights reserved.
//  简单8项跑马灯抽奖

import UIKit

class XPYLotteryViewController: UIViewController {
    /// 奖项间距
    private let lotteryItemSpacing = 20
    /// 奖项宽度
    private let lotteryItemWidth = 60
    /// 奖项高度
    private let lotteryItemHeight = 77
    /// 奖项数组
    private let lotteryItems = ["奖项1", "奖项2", "奖项3", "奖项4", "奖项5", "奖项6", "奖项7", "奖项8"]
    /// 默认选中第一项
    private var selectedIndex = 0
    /// 奖项按钮数组
    private var itemButtons: Array<UIButton>! = []
    /// 当前选中奖项按钮
    private var selectedButton: UIButton!
    
    private var timer: Timer!
    
    lazy var startButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("开始", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.setTitleColor(.gray, for: .disabled)
        button.addTarget(self, action: #selector(XPYLotteryViewController.startAction(_:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "抽奖"
        view.backgroundColor = UIColor.white
        
        configureUI()
    }
    deinit {
        print("x");
        if timer != nil {
            timer.invalidate()
            timer = nil
        }
    }
    
    // MARK: UI
    private func configureUI() {
        var originX = 50;
        var originY = 100;
        for (index, item) in lotteryItems.enumerated() {
            let button = UIButton.init(type: .custom)
            button.isUserInteractionEnabled = false
            button.setTitle(item, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14);
            button.setBackgroundImage(UIImage(named: "lottery_card_normal"), for: .normal)
            button.setBackgroundImage(UIImage(named: "lottery_card_highlighted"), for: .highlighted)
            // 默认高亮状态
            button.isHighlighted = true
            if index < 4 {
                // 第一排正序
                button.frame = CGRect(x: originX, y: originY, width: lotteryItemWidth, height: lotteryItemHeight)
                originX += lotteryItemWidth + lotteryItemSpacing;
            } else {
                // 第二排逆序
                if index % 4 == 0 {
                    // 换行
                    originY += (lotteryItemHeight + lotteryItemSpacing)
                }
                originX -= lotteryItemWidth + lotteryItemSpacing;
                button.frame = CGRect(x: originX, y: originY, width: lotteryItemWidth, height: lotteryItemHeight)
            }
            view.addSubview(button)
            itemButtons.append(button)
        }
        // 设置选中第一项
        selectedButton = itemButtons.first
        
        // 增加开始按钮
        view.addSubview(startButton)
        let centerX = NSLayoutConstraint(item: startButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let top = NSLayoutConstraint(item: startButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier:1, constant: CGFloat(Float(lotteryItemHeight * 2 + originY)))
        let width = NSLayoutConstraint(item: startButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        let height = NSLayoutConstraint(item: startButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        startButton.addConstraints([width, height])
        view.addConstraints([centerX, top])
    }
    
    // MARK: Actions
    
    /// 开始抽奖
    /// - Parameter sender: startButton
    @objc private func startAction(_ sender: UIButton) {
        weak var weakSelf = self
//        timer = Timer.xpy_timer(1, true, { (timer: Timer) in
//            print(weakSelf?.selectedIndex as Any)
//            weakSelf?.selectedIndex += 1
//        })
//        RunLoop.current.add(timer, forMode: .common)
        
        timer = Timer.xpy_scheduledTimer(1, true, { (timer: Timer) in
            print(weakSelf?.selectedIndex as Any)
            weakSelf?.selectedIndex += 1
        })
    }

}
