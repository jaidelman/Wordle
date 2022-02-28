//
//  GameViewModel.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    @Published var alphabetViewModel: AlphabetViewModel = AlphabetViewModel()
    @Published var currentGuessNumber: Int = 1
    @Published var guesses: [WordViewModel] = []
    
    init(correctWord: String) {
        for _ in 0 ..< 6 {
            self.guesses.append(WordViewModel(correctWord: correctWord))
        }
    }
    
    func updateGuess(guess: String) {
        let currentGuess = guesses[currentGuessNumber - 1]
        let index = guess.count == 0 ? 0 : guess.count - 1
        let letter = guess.count == 0 ? nil : guess[guess.count - 1]
        
        //Update letter
        if index < WordViewModel.wordLength {
            currentGuess.updateGuess(index: index, letter: letter)
        }
        
        //On backspace, make sure we set removed letter to nil
        if index < WordViewModel.wordLength - 1 {
            currentGuess.updateGuess(index: index + 1, letter: nil)
        }
    }
    
    func submitGuess() {
        let correctAnswer = guesses[currentGuessNumber - 1].makeGuess()
        currentGuessNumber += 1
    }

}
