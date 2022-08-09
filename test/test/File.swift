//
//  File.swift
//  test
//
//  Created by ByteDance on 2022/6/20.
//

import Foundation
struct Player: Codable {
    var name: String
    var highScore: Int = 0
    var history: [Int] = []

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case highScore = "HighScore"
        case history = "History"
    }
    
    init(_ name: String) {
        self.name = name
    }
}

//Codable, Equatable
extension Player {
    mutating func updateScore(_ newScore: Int) {
        history.append(newScore)
        if highScore < newScore {
            print("\(newScore)! A new high score for \(name)! 🎉")
            highScore = newScore
        }
    }
}


