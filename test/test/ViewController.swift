//
//  ViewController.swift
//  test
//
//  Created by ByteDance on 2022/6/20.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var filePath: URL = {
        let manager = FileManager.default
        var filePath = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        filePath!.appendPathComponent("aderviseInfo.archive")
        return filePath!
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var jsonData: Data?
//
//        // MARK: encode（编码）
//
//        // Player对象
//        var player = Player("Tomas")
//        // 设置歌手分数
//        player.updateScore(50)
//        // 初始化一个encoder对象
//        let encoder = JSONEncoder()
//        do  {
//            // 将player对象encod（编码）
//            let data: Data = try encoder.encode(player)
//
//            do {
//                try data.write(to: filePath)
//                print("保存本地成功")
//            } catch {
//                print("保存本地失败")
//            }
//
//            // 打印
//            print("这是开始")
//            print(data)
//            print(String(data: data, encoding: String.Encoding.utf8) as Any)
//            print(player)
//
//            jsonData = data
//        } catch {
//
//        }
        
        if let jsonData =  try? Data(contentsOf: filePath) {

        // MARK: decode（解码）
        let decoder = JSONDecoder()
        do {
            // 解码得到player对象
            let player: Player = try decoder.decode(Player.self, from: jsonData)
            // 打印
            print(player)
            print("读取")
            print(player.name)
        } catch {
            
        }
        }
    }


}

