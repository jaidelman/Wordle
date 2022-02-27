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
    @Published var guesses: [WordViewModel] = []
    @Published var currentGuessValue: String = "" {
        didSet {
            updateGuess()
        }
    }
    
    init(correctWord: String) {
        for _ in 0 ..< 6 {
            self.guesses.append(WordViewModel(correctWord: correctWord))
        }
    }
    
    func updateGuess() {
        let currentGuess = guesses[currentGuessNumber]
        let index = currentGuessValue.count == 0 ? 0 : currentGuessValue.count - 1
        let letter = currentGuessValue.count == 0 ? nil : currentGuessValue[currentGuessValue.count - 1]
        
        currentGuess.updateGuess(index: index, letter: letter)
    }
    
    func confirmGuess() {
        
    }
}
