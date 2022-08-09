//
//  alterview.swift
//  firstapp
//
//  Created by ByteDance on 2022/6/10.
//

import UIKit

class alterview: UIViewController {

    // 取得尺寸
    let fullScreenSize = UIScreen.main.bounds.size

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 提示按钮
        var myButton = UIButton(type: .system)
        myButton.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        myButton.setTitle("提示", for: .normal)
        myButton.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myButton.addTarget(nil, action: #selector(alterview.simpleHint), for: .touchUpInside)
        myButton.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.15)
        self.view.addSubview(myButton)
            
        // 显示确认或取消
        myButton = UIButton(type: .system)
        myButton.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        myButton.setTitle("发送", for: .normal)
        myButton.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myButton.addTarget(nil, action: #selector(alterview.confirm), for: .touchUpInside)
        myButton.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.3)
        self.view.addSubview(myButton)
            
        // 提示删除
        myButton = UIButton(type: .system)
        myButton.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        myButton.setTitle("刪除", for: .normal)
        myButton.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myButton.addTarget(nil, action: #selector(alterview.deleteSomething), for: .touchUpInside)
        myButton.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.45)
        self.view.addSubview(myButton)
        
        // 提示登入
        myButton = UIButton(type: .system)
        myButton.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        myButton.setTitle("登入", for: .normal)
        myButton.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myButton.addTarget(nil, action: #selector(alterview.login), for: .touchUpInside)
        myButton.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.6)
        self.view.addSubview(myButton)
            
        // 底部提示
        myButton = UIButton(type: .system)
        myButton.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        myButton.setTitle("底部提示", for: .normal)
        myButton.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myButton.addTarget(nil, action: #selector(alterview.bottomAlert), for: .touchUpInside)
        myButton.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.75)
        self.view.addSubview(myButton)
    }
        
    @objc func simpleHint() {
        // 建立一個提示框
        let alertController = UIAlertController(title: nil, message: "一个简单提示，请按确认继续", preferredStyle: .alert)

        // 建立确认按钮
        let okAction = UIAlertAction(title: "确认", style: .default, handler: {
            (action: UIAlertAction!) -> Void in
            print("后续动作")
        })
        alertController.addAction(okAction)
            
        // 顯示提示框
        self.present(alertController, animated: true, completion: nil)
    }

    @objc func confirm() {
        // 建立一個提示框
        let alertController = UIAlertController(title: "送出", message: "确认送出？", preferredStyle: .alert)
            
        // 建立[取消]按鈕
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
            
        // 建立[送出]按鈕
        let okAction = UIAlertAction(title: "送出", style: .default, handler: nil)
        alertController.addAction(okAction)
            
        // 顯示提示框
        self.present(alertController, animated: true, completion: nil)
    }
        
    @objc func deleteSomething() {
        // 建立一個提示框
        let alertController = UIAlertController(title: "刪除", message: "刪除字樣會變紅色的", preferredStyle: .alert)
            
        // 建立[取消]按鈕
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        // 建立[刪除]按鈕
        let okAction = UIAlertAction(title: "刪除", style: .destructive, handler: nil)
            alertController.addAction(okAction)

        // 顯示提示框
        self.present(alertController, animated: true, completion: nil)
    }
        
    @objc func login() {
        // 建立一個提示框
        let alertController = UIAlertController(title: "登入", message: "請輸入帳號與密碼", preferredStyle: .alert)
            
        // 建立兩個輸入框
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "帳號"
        }
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "密碼"
                
            // 如果要輸入密碼 這個屬性要設定為 true
            textField.isSecureTextEntry = true
        }

        // 建立[取消]按鈕
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
            
        // 建立[登入]按鈕
        let okAction = UIAlertAction(title: "登入", style: .default) {
            (action: UIAlertAction!) -> Void in
            let acc = (alertController.textFields?.first)! as UITextField
            let password = (alertController.textFields?.last)! as UITextField
            
            print("輸入的帳號為：\(acc.text!)")
            print("輸入的密碼為：\(password.text!)")
        }
        alertController.addAction(okAction)
        
        // 显示提示框
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func bottomAlert() {
        // 建立一個提示框
        let alertController = UIAlertController(title: "底部提示", message: "這個提示會從底部彈出", preferredStyle: .actionSheet)
        
        // 建立[取消]按鈕
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // 建立[確認]按鈕
        let okAction = UIAlertAction(title: "確認", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        // 顯示提示框
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
