//
//  TaskItem.swift
//  tableviewdemo
//
//  Created by ByteDance on 2022/6/16.
//

import UIKit
        //        JSONDecoder
struct TaskItem: Codable {
    
    var title: String
    var taskDetail: String?
    var uuid: String
    var isComplete: Bool
    // 添加其他需要参数
    
    init(title: String, taskDetail: String?) {
        self.title = title
        self.taskDetail = taskDetail
        uuid = UUID().uuidString
        isComplete = false
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case taskDetail = "TaskDetail"
        case uuid = "uuid"
        case isComplete = "isComplete"
    }
    
}

extension TaskItem : Equatable{
    static func == (lhs: TaskItem, rhs: TaskItem) -> Bool {
        return
            lhs.uuid == rhs.uuid
    }
}
