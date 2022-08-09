//
//  AppDelegate.swift
//  tableviewdemo
//
//  Created by ByteDance on 2022/6/16.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    // 创建taskStore对象
    let taskStore = TaskStore()
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        let success = taskStore.saveChanges()
        if (success) {
            print("保存成功")
        } else {
            print("保存失败")
        }
    }

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 1. 创建window对象
        //  1.1 UIScreen.main.bounds可以获取到主屏幕，
        //      类型是CGRect，origin是（0，0），size是屏幕尺寸，但唯实poingts
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let taskTableView = TaskTableView()
        let scoreTableView = ScrollViewController()
        // 设置ItemViewController的taskStore
        taskTableView.taskStore = taskStore
        
        // 2. 给window对象的rootViewController赋值
        //window?.rootViewController = taskTableView
        window?.rootViewController = scoreTableView
        
        // 3. 让window视图用户可见
        window?.makeKeyAndVisible()
        
       
        
        return true
    }
    

}

