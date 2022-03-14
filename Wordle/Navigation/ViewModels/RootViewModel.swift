//
//  RootViewModel.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-03-08.
//

import Foundation

import SwiftUI

enum ViewType {
    case home
    case game
    case stats
}

class RootViewModel: ObservableObject {
    @Published var currentView: ViewType = .home
    @Published var gameViewModel = GameViewModel()
    
    init() {
        let defaults = UserDefaults.standard
        let keys = UserDefaults.Keys.self
        
        // If first time playing, set up user defaults
        if defaults.object(forKey: keys.games) == nil {
            defaults.set(0, forKey: keys.games)
            defaults.set(0, forKey: keys.wins)
            defaults.set(0, forKey: keys.oneGuess)
            defaults.set(0, forKey: keys.twoGuess)
            defaults.set(0, forKey: keys.threeGuess)
            defaults.set(0, forKey: keys.fourGuess)
            defaults.set(0, forKey: keys.fiveGuess)
            defaults.set(0, forKey: keys.sixGuess)
        }
    }
    
    func updateCurrentView(_ viewType: ViewType) {
        if viewType == .game {
            self.gameViewModel = GameViewModel()
        }
        
        self.currentView = viewType
    }
}
