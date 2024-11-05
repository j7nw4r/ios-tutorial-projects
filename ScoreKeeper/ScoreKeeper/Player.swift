//
//  Player.swift
//  ScoreKeeper
//
//  Created by j on 11/3/24.
//

import Foundation

struct Player: Identifiable {
    let id: UUID = UUID()
    var name: String
    var score: Int
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.score == rhs.score
    }
}
