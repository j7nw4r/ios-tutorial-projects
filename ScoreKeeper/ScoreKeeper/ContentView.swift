//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by j on 11/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var scoreboard: Scoreboard = .init()
    @State private var playerStartingPoints: Int = 10
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            SettingsView(startingPoints: $playerStartingPoints, doesHighestScoreWin: $scoreboard.doeesHighestScoreWin)
                .disabled(scoreboard.state != .setup)
            
            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                        .opacity(scoreboard.state != .setup ? 0 : 1)
                }
                .font(.headline)
                
                ForEach($scoreboard.players) { $player in
                    GridRow {
                        HStack {
                            if scoreboard.winners.contains(player) {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(.yellow)
                            }
                            TextField("Name", text: $player.name)
                                .disabled(scoreboard.state != .setup)
                        }
                        Text("\(player.score)")
                            .opacity(scoreboard.state != .setup ? 0 : 1)
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus") {
                scoreboard.players.append(
                    Player(name: "Player \(scoreboard.players.count + 1)", score: 0)
                )
            }
            .buttonStyle(.borderedProminent)
            .opacity(scoreboard.state != .setup ? 0 : 1)
            
            Spacer()
            
            HStack {
                Spacer()
                switch scoreboard.state {
                case .setup:
                    Button("Start Game", systemImage: "play.fill") {
                        scoreboard.state = .playing
                        scoreboard.resetScores(to: playerStartingPoints)
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                    .tint(.blue)
                case .playing:
                    Button("End Game", systemImage: "stop.fill") {
                        scoreboard.state = .gameOver
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                    .tint(.blue)
                case .gameOver:
                    Button("Reset Game", systemImage: "arrow.counterclockwise") {
                        scoreboard.state = .setup
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                    .tint(.blue)
                }
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
