//
//  AppDelegate.swift
//  thread
//
//  Created by ByteDance on 2022/6/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 1. 创建window对象
        //  1.1 UIScreen.main.bounds可以获取到主屏幕，
        //      类型是CGRect，origin是（0，0），size是屏幕尺寸，但唯实poingts
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootView = RootViewController()
        
        // 2. 给window对象的rootViewController赋值
        //window?.rootViewController = taskTableView
        window?.rootViewController = rootView
        
        // 3. 让window视图用户可见
        window?.makeKeyAndVisible()
        
       
        
        return true
    }
    

}


