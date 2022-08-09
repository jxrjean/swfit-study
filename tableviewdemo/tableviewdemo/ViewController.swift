//
//  ViewController.swift
//  tableviewdemo
//
//  Created by ByteDance on 2022/6/16.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .gray
        
        // 是否可以拉出空白区域
        scrollView.bounces = false
        scrollView.alwaysBounceVertical = false
        
        // 滚动条设置
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        // Do any additional setup after loading the view.
    }


}

