//
//  TaskViewCell.swift
//  tableviewdemo
//
//  Created by ByteDance on 2022/6/17.
//

import UIKit

class TaskViewCell: UITableViewCell {
    
    // 将内容添加到contentView中
    var title: String = "Demo" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var isComplete = true {
        didSet {
            myswitch.isOn = isComplete
        }
    }
    
    private lazy var titleLabel = UILabel()
    private lazy var myswitch = UISwitch()
    var taskStore: TaskStore?
    var indexPathRow: Int = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func switchChange() {
        isComplete = myswitch.isOn
        taskStore?.allTaskItems[indexPathRow].isComplete = isComplete
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        myswitch.addTarget(self, action: #selector(switchChange), for: .valueChanged)
    
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(myswitch)
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
        }
        
        myswitch.snp.makeConstraints { make in
            make.right.equalTo(self.contentView.snp.right).offset(-10)
            make.top.equalToSuperview().offset(10)
        }
    }
    
}
