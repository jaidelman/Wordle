//
//  GameViewModel.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    private let correctAnswer: String
    @Published var alphabetViewModel: AlphabetViewModel = AlphabetViewModel()
    @Published var currentGuessNumber: Int = 1
    @Published var guesses: [WordViewModel] = []
    @Published var correctGuess: Bool = false
    
    init(correctAnswer: String) {
        self.correctAnswer = correctAnswer
        
        for _ in 0 ..< 6 {
            self.guesses.append(WordViewModel(correctAnswer: correctAnswer))
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
        let currentGuess = guesses[currentGuessNumber - 1]
        correctGuess = currentGuess.makeGuess()
        
        alphabetViewModel.makeGuess(guess: currentGuess.getGuess(), correctAnswer: correctAnswer)
        currentGuessNumber += 1
    }

}
