//
//  GameOverViewModel.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-28.
//

import SwiftUI

class GameOverViewModel: ObservableObject {
    var game: Game
    
    private let viewWidth = UIScreen.main.bounds.width/1.2
    private let viewHeight = UIScreen.main.bounds.height/4
    
    init(game: Game) {
        self.game = game
    }
    
    func updateUserStats() {
        let defaults = UserDefaults.standard
        let keys = UserDefaults.Keys.self
        
        let games = defaults.integer(forKey: keys.games)
        defaults.set(games+1, forKey: keys.games)
        
        if game.correctGuess {
            let wins = defaults.integer(forKey: keys.wins)
            defaults.set(wins+1, forKey: keys.wins)
            
            let keyForNumGuesses: String
            switch(numGuesses) {
            case 1:
                keyForNumGuesses = keys.oneGuess
            case 2:
                keyForNumGuesses = keys.twoGuess
            case 3:
                keyForNumGuesses = keys.threeGuess
            case 4:
                keyForNumGuesses = keys.fourGuess
            case 5:
                keyForNumGuesses = keys.fiveGuess
            case 6:
                keyForNumGuesses = keys.sixGuess
            default:
                keyForNumGuesses = ""
            }
            
            let num = defaults.integer(forKey: keyForNumGuesses)
            defaults.set(num+1, forKey: keyForNumGuesses)
        }
    }
    
    var width: CGFloat {
        return viewWidth
    }
    
    var height: CGFloat {
        return viewHeight
    }
    
    var numGuesses: Int {
        return game.currentGuessNumber - 1
    }
    
    var text: String {
        if game.correctGuess {
            return "You won in \(self.numGuesses) \(self.numGuesses == 1 ? "guess" : "guesses")!"
        } else {
            return "Good try! The correct answer was \(game.guesses[0].correctAnswer)"
        }
    }

}
