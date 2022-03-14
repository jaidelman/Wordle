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
        let defaults = UserDefaults.standard
        let keys = UserDefaults.Keys.self
        
        let wins = defaults.integer(forKey: keys.wins)
        let games = defaults.integer(forKey: keys.games)
        self.stats = Stats(wins: wins, games: games)
    }
    
    var numGames: Int {
        return stats.games
    }
    
    var numWins: Int {
        return stats.wins
    }
    
    var winPercent: CGFloat {
        return CGFloat(stats.wins)/CGFloat(stats.games)
    }
    
}
