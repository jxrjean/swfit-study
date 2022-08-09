//
//  main.swift
//  NetStateAlter
//
//  Created by ByteDance on 2022/6/13.
//

import Foundation

// 网络状态，选取中文体验一下swift可以使用全unicode编码，建议英文
enum NetState {
    case 好
    case 中
    case 差
}

// 网络状态记录，包含一些我们想要的信息
struct NetStateRecord{
    let netState: NetState
    let recordDate: Date
    // 其他想拓展的信息
    
   /* init(_ netState: NetState, _ recordDate: NSDate) {
        self.netState = netState
        self.recordDate = recordDate
    } */
}

// 网络状态告警器
class NetStateAlter {
    // 维护规则1，1分钟内三次的的网络状态记录数组
    private var badInOneMin: [NetStateRecord]
    // 维护规则2，持续3分钟以上的回调大于80%
    private var stateInThrMin: [NetStateRecord]
    // 保存上次弹窗的时间
    private var lastAlterTime: Date?
    
    init(){
        badInOneMin = []
        stateInThrMin = []
    }
    
    // 是否离上次已经10分钟，是返回真,此处用10代替10*60用以测试
    func isCanAlter(_ netStateRecord: NetStateRecord) -> Bool {
        if let lastAlterTime = lastAlterTime {
            let time = netStateRecord.recordDate.timeIntervalSince(lastAlterTime)
            if time > 10 {
                return true
            }
        } else {
            return true
        }
        return false
    }
    
    // 数组1分钟内有3次即可，此处改1*60s 1s方便测试
    func matchRule1(_ netStateRecord: NetStateRecord) -> Bool {
        badInOneMin.append(netStateRecord)
        //体验下swift的filter函数，可以直接数组从前开始删除
        badInOneMin = badInOneMin.filter{
            netStateRecord.recordDate.timeIntervalSince($0.recordDate) < 1 }
        if badInOneMin.count >= 3 && isCanAlter(netStateRecord) {
            print("匹配规则1")
            return true
        }
        return false
    }
    
    // 这里根据题意计算3分钟网络差状态达到80%，此处改3*60s为3s方便测试
    func matchRule2(_ netStateRecord: NetStateRecord)  -> Bool {
        //没有3分钟的状态没有持续意义，比如传入第一个是差，直接就会弹窗了
        if !stateInThrMin.isEmpty {
             let time = stateInThrMin[stateInThrMin.count - 1]
                .recordDate
                .timeIntervalSince(stateInThrMin[0].recordDate)
            if time <= 3 {
                return false
            }
        }
        stateInThrMin = stateInThrMin.filter{
            netStateRecord.recordDate.timeIntervalSince($0.recordDate as Date) <= 3 }
        let badStateArr = stateInThrMin.filter {$0.netState == .差 }
        if Double(badStateArr.count) / Double(stateInThrMin.count) >= 0.8
            && isCanAlter(netStateRecord){
            print("匹配规则2")
            return true
        }
        return false
    }
    
    // 根据传入的网络状态记录检查是否需要弹窗
    func notifyNetState(_ netStateRecord: NetStateRecord) -> Bool {
        switch netStateRecord.netState {
        case .好 :
            stateInThrMin.append(netStateRecord)
        case .中:
            stateInThrMin.append(netStateRecord)
        case .差:
            stateInThrMin.append(netStateRecord)
            if matchRule1(netStateRecord) || matchRule2(netStateRecord) {
                lastAlterTime = netStateRecord.recordDate
                return true
            }
        }
        return false
    }
    
}

func alterWindow(){
    print("模拟弹出告警框")
}

//测试
func main() {
    let netStateAlter = NetStateAlter()
    while true {
        Thread.sleep(forTimeInterval: 0.2)
        let number = Int(arc4random_uniform(3))
        print(number)
        let dict: [Int : NetState] = [0: .好, 1: .中, 2: .差]
        let netStateRecord = NetStateRecord(netState: dict[number]!, recordDate: Date())
        if netStateAlter.notifyNetState(netStateRecord) {
            alterWindow()
        }
    }

}

main()
