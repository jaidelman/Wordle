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
    
    func updateCurrentView(_ viewType: ViewType) {
        if viewType == .game {
            self.gameViewModel = GameViewModel()
        }
        
        self.currentView = viewType
    }
}
