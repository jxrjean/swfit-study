//
//  ReSwiftDemo.swift
//  thread
//
//  Created by ByteDance on 2022/6/21.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit

class ReSwiftDemo: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let button = UIButton()
        view.addSubview(button)
        
        button.backgroundColor = .blue
        
            
        button.setTitle("XXwX", for: .normal)
        
        button.rx.tap
            .subscribe(onNext: {
                print("button Tapped")
            })
            .disposed(by: disposeBag)
        
        button.snp.makeConstraints{ make in
            make.center.equalToSuperview()
            make.width.equalTo(30)
            make.height.equalTo(30)
            
        }
        
        
    }
}
