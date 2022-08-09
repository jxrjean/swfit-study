//
//  main.swift
//  LRUcache
//
//  Created by ByteDance on 2022/6/7.
//

import Foundation
//map filter forEach


struct Node<Element> {
    var key: Int
    var value: Element
    var next: Int?
    var pri: Int?
    init(_ key: Int, _ value: Element) {
        self.key = key
        self.value = value
    }
}

struct LRUcache<Element> {
    var cap : Int
    var cache = [Int : Node<Element>]()
    var head = 0 //指向头节点
    var tail = 0 //指向尾节点
    init(_ cap: Int) {
        self.cap = cap
    }
    
    mutating func pushFornt(_ node: inout Node<Element>) {
        cache[node.key] = node
        if var nextNode = cache[head] {   //更改第二个节点的pri指针
            nextNode.pri = node.key
            cache.updateValue(nextNode, forKey: head)
        } else {
            tail = node.key
        }
        node.pri = 0
        node.next = head
        head = node.key
        cache.updateValue(node, forKey: node.key)
    }
    
    mutating func delete(_ node: Node<Element>) {
        if var priNode = cache[node.pri!] {
            priNode.next = node.next
            cache.updateValue(priNode, forKey: priNode.key)
        }
        if var nextNode = cache[node.next!] {
            nextNode.pri = node.pri
            cache.updateValue(nextNode, forKey: nextNode.key)
        }
        cache.removeValue(forKey: node.key)
    }
    
    mutating func popBack() {
        if let priNode = cache[tail] {
            tail = priNode.pri!
            cache.removeValue(forKey: priNode.key)
        }
    }
    
    //@discardableResult mutating func getvalue(by key: Int) -> Element? {
    mutating func getvalue(by key: Int) -> Element? {
        if var node = cache[key] {
            delete(node)
            pushFornt(&node)
            return node.value
        }
        return nil
    }
    mutating func put(_ key: Int, _ value: Element) {
        if var node = cache[key] {
            node.value = value
            delete(node)
            pushFornt(&node)
        }else{
            if cache.count == cap {
                popBack()
            }
            var node = Node<Element>(key,value)
            pushFornt(&node)
        }
        
    }
    
}

func main() {
    var lru = LRUcache<String>(3)
    lru.put(1, "ss")
    lru.put(2, "kk")
    lru.put(3, "sx")
    lru.put(4, "jj")
    print("输出： \(String(describing: lru.cache[1]))")
    print("输出： \(String(describing: lru.cache[2]))")
    print("输出： \(String(describing: lru.cache[3]))")
    print("输出： \(String(describing: lru.cache[4]))")
    lru.getvalue(by: 2)
    print("输出： \(String(describing: lru.cache[1]))")
    print("输出： \(String(describing: lru.cache[2]))")
    print("输出： \(String(describing: lru.cache[3]))")
    print("输出： \(String(describing: lru.cache[4]))")

}

main()
