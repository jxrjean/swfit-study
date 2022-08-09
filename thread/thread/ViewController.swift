//
//  ViewController.swift
//  thread
//
//  Created by ByteDance on 2022/6/20.
//

import UIKit

class ViewController: UIViewController {

    //定义两个线程
        var thread1:Thread?
        var thread2:Thread?
         
        //定义两个线程条件，用于锁住线程
        let condition1 = NSCondition()
        let condition2 = NSCondition()
        
        override func viewDidLoad() {
            super.viewDidLoad()
             
            thread2 = Thread(target: self, selector: #selector(ViewController.method2),
                             object: nil)
            thread1 = Thread(target: self, selector: #selector(ViewController.method1),
                             object: nil)
            thread1?.start()
        }
         
        //定义两方法，用于两个线程调用
        @objc func method1(sender:AnyObject){
            for i in 0 ..< 10 {
                print("Thread 1 running \(i)")
                sleep(1)
                 
                if i == 2 {
                    thread2?.start() //启动线程2
                     
                    //本线程（thread1）锁定
                    condition1.lock()
                    condition1.wait()
                    condition1.unlock()
                }
            }
             
            print("Thread 1 over")
             
            //线程2激活
            condition2.signal()
        }
         
        //方法2
        @objc func method2(sender:AnyObject){
            for i in 0 ..< 10 {
                print("Thread 2 running \(i)")
                sleep(1)
                 
                if i == 2 {
                    //线程1激活
                    condition1.signal()
                     
                    //本线程（thread2）锁定
                    condition2.lock()
                    condition2.wait()
                    condition2.unlock()
                }
            }
             
            print("Thread 2 over")

        }
}

