//
//  stackview.swift
//  firstapp
//
//  Created by ByteDance on 2022/6/10.
//

import UIKit
import SnapKit

class stackview: UIViewController {

    var stackView: UIStackView = UIStackView()
    var nestedStackView = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical //垂直方向布局
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.backgroundColor = UIColor.brown //注意：这里设置背景颜色无效，说明stackView并没有被渲染到屏幕上
        view.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview().inset(20)
        }
 
        var label = UILabel()
        label.text = "Label 1"
        label.backgroundColor = UIColor.red
        stackView.addArrangedSubview(label)
 
        label = UILabel()
        label.text = "Label 2"
        label.backgroundColor = UIColor.cyan
        stackView.addArrangedSubview(label)
 
        nestedStackView.axis = .horizontal // 水平方向布局
        nestedStackView.alignment = .fill
        nestedStackView.spacing = 20
        nestedStackView.distribution = .fillEqually
        nestedStackView.addArrangedSubview(UIButton(type: .infoDark))
        nestedStackView.addArrangedSubview(UIButton(type: .infoLight))
        nestedStackView.addArrangedSubview(UIButton(type: .contactAdd))
        stackView.addArrangedSubview(nestedStackView)
 
        // 添加按钮实现隐藏nestedStackView功能
        let button = UIButton(type: .custom)
        button.setTitle("Press Me", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(pressMe(button:)), for: .touchUpInside)
        stackView.addArrangedSubview(button)
      
    }
 
    @objc func pressMe(button: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.nestedStackView.isHidden = !self.nestedStackView.isHidden
        }
    }

}
