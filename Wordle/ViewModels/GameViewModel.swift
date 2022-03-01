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
    @Published private var game: Game = Game()
    
    init(correctAnswer: String) {
        self.correctAnswer = correctAnswer
        
        for _ in 0 ..< 6 {
            self.game.guesses.append(WordViewModel(correctAnswer: correctAnswer))
        }
    }
    
    var guessesCount: Int {
        return game.guesses.count
    }
    
    var alphabetViewModel: AlphabetViewModel {
        return game.alphabetViewModel
    }
    
    var correctGuess: Bool {
        return game.correctGuess
    }
    
    var currentGuessNumber: Int {
        return game.currentGuessNumber
    }
    
    func getGuessAtIndex(_ index: Int) -> WordViewModel {
        return game.guesses[index]
    }
    
    func updateGuess(guess: String) {
        let currentGuess = game.guesses[game.currentGuessNumber - 1]
        let index = guess.count == 0 ? 0 : guess.count - 1
        let letter = guess.count == 0 ? nil : guess[guess.count - 1]
        
        //Update letter
        if index < Word.wordLength {
            currentGuess.updateGuess(index: index, letter: letter)
        }
        
        //On backspace, make sure we set removed letter to nil
        if index < Word.wordLength - 1 {
            currentGuess.updateGuess(index: index + 1, letter: nil)
        }
    }
    
    func submitGuess() {
        let currentGuess = game.guesses[game.currentGuessNumber - 1]
        game.correctGuess = currentGuess.makeGuess()
        
        game.alphabetViewModel.makeGuess(guess: currentGuess.getGuess(), correctAnswer: correctAnswer)
        game.currentGuessNumber += 1
    }

}
