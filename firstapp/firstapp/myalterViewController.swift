//
//  myalterViewController.swift
//  firstapp
//
//  Created by ByteDance on 2022/6/10.
//

import UIKit
import SnapKit

class myalterViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        print(#function)
        //view.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: 200, height: 200)
        view.snp.makeConstraints{ (make) in
                               make.width.equalTo(100)
                               make.height.equalTo(100)
        }
    }
    
}
