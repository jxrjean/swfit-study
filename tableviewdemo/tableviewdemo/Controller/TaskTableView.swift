//
//  TaskTableView.swift
//  tableviewdemo
//
//  Created by ByteDance on 2022/6/16.
//

import UIKit
import SnapKit

class TaskTableView : UIViewController, UITableViewDelegate, UITableViewDataSource {
    var taskStore: TaskStore!
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TaskViewCell.self, forCellReuseIdentifier: "TaskViewCell")
        
        
        tableHeadViewDidLoad()
        
        
        
    }
    
    // 表头，用以添加管理
    func tableHeadViewDidLoad() {
        let tableHeadView = UIView()
        tableHeadView.backgroundColor = .gray
        view.addSubview(tableHeadView)
        
        let editButton = UIButton()
        let addButton = UIButton()
        editButton.setTitle("编辑模式", for: .normal)
        addButton.setTitle("添加", for: .normal)
        
        editButton.addTarget(self, action: #selector(editNewTask(_:)), for: .touchUpInside)
        
        addButton.addTarget(self, action: #selector(addNewTask(_:)), for: .touchUpInside)
        
        tableHeadView.addSubview(editButton)
        tableHeadView.addSubview(addButton)
        
        tableHeadView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.height.equalTo(view.snp.height).multipliedBy(0.15)
            make.width.equalTo(view.snp.width)
        }
        
        editButton.snp.makeConstraints { make in
            make.left.equalTo(tableHeadView.snp.left).offset(30)
            make.bottom.equalTo(tableHeadView.snp.bottom)
        }
        
        addButton.snp.makeConstraints { make in
            make.right.equalTo(tableHeadView.snp.right).offset(-30)
            make.bottom.equalTo(tableHeadView.snp.bottom)
        }
        
        view.addSubview(tableView)
        
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(tableHeadView.snp.bottom).offset(10)
            make.left.equalTo(view.snp.left)
            make.size.equalToSuperview()
        }
        
    }
    
    // 添加任务按钮对应事件
    @IBAction
    func addNewTask(_ sender: UIButton) {
        // 建立一個提示框
        let alertController = UIAlertController(title: "建立新任务", message: nil, preferredStyle: .alert)
            
        // 输入框
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "标题"
        }
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "内容"
        }

        // 建立[取消]按钮
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
            
        // 建立[确定]按钮
        let okAction = UIAlertAction(title: "确定", style: .default) {
            (action: UIAlertAction!) -> Void in
            let taskTitle = (alertController.textFields?.first)! as UITextField
            let detail = (alertController.textFields?.last)! as UITextField
            
            let taskItem = self.taskStore.createTask(title: taskTitle.text!, detail: detail.text)
            if let index = self.taskStore.allTaskItems.firstIndex(of: taskItem) {
                let indexPath = IndexPath(row: index, section: 0)
                self.tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
        alertController.addAction(okAction)
        
        // 显示提示框
        self.present(alertController, animated: true, completion: nil)
    }
    
    // 编辑任务按钮对应事件
    @IBAction
    func editNewTask(_ sender: UIButton) {
        if tableView.isEditing {
            sender.setTitle("编辑模式", for: .normal)
            // 退出编辑
            tableView.setEditing(false, animated: true)
        } else {
            sender.setTitle("完成", for: .normal)
            // 进入编辑
            tableView.setEditing(true, animated: true)
        }
    }
    
    // 返回行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskStore.allTaskItems.count
    }
    
    // 删除行
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = taskStore.allTaskItems[indexPath.row]
            
            taskStore.removeTask(task)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    // 移动
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        taskStore.moveTask(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    // 返回子组件
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let taskCell = tableView.dequeueReusableCell(withIdentifier: "TaskViewCell",for: indexPath) as! TaskViewCell
        let taskItem = taskStore.allTaskItems[indexPath.row]
        
        taskCell.title = taskItem.title
        taskCell.isComplete = taskItem.isComplete
        taskCell.taskStore = taskStore
        taskCell.indexPathRow = indexPath.row
        
        return taskCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 编辑模式下可以操作
        if !tableView.isEditing {
            var task = taskStore.allTaskItems[indexPath.row]

            // 建立一個提示框
            let alertController = UIAlertController(title: "更新任务", message: nil, preferredStyle: .alert)

            // 输入框
            alertController.addTextField {
                (textField: UITextField!) -> Void in
                textField.placeholder = "新标题"
                textField.text = task.title
            }
            alertController.addTextField {
                (textField: UITextField!) -> Void in
                textField.placeholder = "新内容"
                textField.text = task.taskDetail
            }

            // 建立[取消]按钮
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)

            // 建立[确定]按钮
            let okAction = UIAlertAction(title: "确定", style: .default) {
                (action: UIAlertAction!) -> Void in
                let taskTitle = (alertController.textFields?.first)! as UITextField
                let detail = (alertController.textFields?.last)! as UITextField

                if let title = taskTitle.text {
                    task.title = title
                    task.taskDetail = detail.text
                }
                self.taskStore.allTaskItems[indexPath.row] = task
                tableView.reloadData()
            }
            alertController.addAction(okAction)

            // 显示提示框
            self.present(alertController, animated: true, completion: nil)
        }
    
    }
}
