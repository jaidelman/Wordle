//
//  GameViewModel.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    @Published var currentGuessNumber: Int = 0
    @Published var currentGuess: String = ""
    @Published var guesses: [WordViewModel] = []
    
    init(correctWord: String) {
        for _ in 0 ..< 6 {
            self.guesses.append(WordViewModel(correctWord: correctWord))
        }
    }
    
    func confirmGuess() {
        
    }
}
