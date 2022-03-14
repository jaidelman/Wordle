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
    
    init() {
        self.correctAnswer = GameViewModel.chooseCorrectWordForGame()
        print(self.correctAnswer)
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
    
    class func chooseCorrectWordForGame() -> String {
        if let path = Bundle.main.path(forResource: "WordBank", ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let words = data.components(separatedBy: .newlines)
                let index = Int.random(in: 0 ..< words.count - 1)
                
                return words[index].uppercased()
            } catch {
                print(error)
            }
        }
        
        //Default word if something goes wrong
        return "BLANK"
    }

}
