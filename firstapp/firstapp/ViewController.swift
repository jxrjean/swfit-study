//
//  ViewController.swift
//  firstapp
//
//  Created by ByteDance on 2022/6/10.
//

import UIKit

class ViewController: UIViewController {
    let fullScreenSize = UIScreen.main.bounds.size
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print(#function)
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print(#function)
    }
    override func loadView() {
        super.loadView()
        print(#function)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        // Do any additional setup after loading the view.
        // 提示按钮
        var myButton = UIButton(type: .system)
        myButton.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        myButton.setTitle("提示", for: .normal)
        myButton.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myButton.addTarget(nil, action: #selector(alterview.simpleHint), for: .touchUpInside)
        myButton.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.15)
        self.view.addSubview(myButton)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#function)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#function)
    }
    deinit{
        print(#function)
    }
    
    @objc func simpleHint() {
        let vc = myalterViewController(nibName: "View", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        /*vc.view.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: 200, height: 200)
        vc.view.snp.makeConstraints{ (make) in
                               make.width.equalTo(100)
                               make.height.equalTo(100)
        }*/
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    // UIView
}

