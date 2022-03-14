//
//  StatsViewModel.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-03-13.
//

import Foundation
import SwiftUI

class StatsViewModel: ObservableObject {
    var stats: Stats
    
    init() {
        let wins = 12
        let games = 15
        let guessStats = [2, 2, 2, 2, 2, 2]
        self.stats = Stats(guessStats: guessStats, wins: wins, games: games)
    }
    
    func getStatsForNumGuesses(_ numGuesses: Int) -> Int {
        return stats.guessStats[numGuesses - 1]
    }
    
    var numGames: Int {
        return stats.games
    }
    
    var numWins: Int {
        return stats.wins
    }
    
}
