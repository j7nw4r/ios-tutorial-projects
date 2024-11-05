//
//  Scoreboard.swift
//  ScoreKeeper
//
//  Created by j on 11/3/24.
//

import Foundation

struct Scoreboard {
    var players: [Player] = [
        Player(name: "Elisha", score: 0),
        Player(name: "Andre", score: 0),
        Player(name: "Jasmine", score: 0),
    ]
    var state: GameState = .setup
    var doeesHighestScoreWin: Bool = true
    
    var winners: [Player] {
        guard state == .gameOver else { return [] }
        
        var winningScore = 0;
        if doeesHighestScoreWin {
            winningScore = Int.min
            for player in players {
                winningScore = max(winningScore, player.score)
            }
        } else {
            winningScore = Int.max
            for player in players {
                winningScore = min(winningScore, player.score)
            }
        }
        
        return players.filter { player in
            player.score == winningScore
        }
    }

    mutating func resetScores(to newValue: Int) {
        for index in players.indices {
            players[index].score = newValue
        }
    }
}
