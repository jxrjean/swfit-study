//
//  TaskStore.swift
//  tableviewdemo
//
//  Created by ByteDance on 2022/6/16.
//

import UIKit
// 用以存储Task任务列表,从controller分离存储，实现解耦
class TaskStore {
    
    var allTaskItems = [TaskItem]()
    
    let itemArchiveURL: URL = {
        let documentsDirectories =
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    func saveChanges() -> Bool {
        let encoder = JSONEncoder()
                do  {
                    // 将itemTask对象encod（编码）
                    let data: Data = try encoder.encode(allTaskItems)
        
                    do {
                        try data.write(to: itemArchiveURL)
                        print("保存本地成功")
                        return true
                    } catch {
                        print("保存本地失败")
                    }
                } catch {
        
                }
        return false
        
    }
    
    // 添加
    @discardableResult func createTask(title:String, detail: String?) -> TaskItem {
        let newTaskItem = TaskItem(title: title, taskDetail: detail)
        
        allTaskItems.append(newTaskItem)
        
        return newTaskItem
    }
    
    // 删除
    func removeTask(_ taskItem: TaskItem) {
        if let index = allTaskItems.firstIndex(of: taskItem) {
            allTaskItems.remove(at: index)
        }
    }
    
    // 移动
    func moveTask(from index: Int, to toindex: Int) {
        if index == toindex {
            return
        }
        
        let moveTask = allTaskItems[index]
        
        allTaskItems.remove(at: index)
        
        allTaskItems.insert(moveTask, at: toindex)
    }
    
    init() {
        if let jsonData =  try? Data(contentsOf: itemArchiveURL) {
            // MARK: decode（解码）
            let decoder = JSONDecoder()
            do {

                let allTaskItems: [TaskItem] = try decoder.decode([TaskItem].self, from: jsonData)
                self.allTaskItems = allTaskItems
            } catch {
                
            }
        }
    }
    
}
