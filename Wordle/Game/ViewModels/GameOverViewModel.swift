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
    
    var width: CGFloat {
        return viewWidth
    }
    
    var height: CGFloat {
        return viewHeight
    }
    
    var numGuesses: Int {
        return game.currentGuessNumber
    }
    
    var text: String {
        if game.correctGuess {
            return "You won in \(self.numGuesses - 1) \(self.numGuesses - 1 == 1 ? "guess" : "guesses")!"
        } else {
            return "Good try! The correct answer was \(game.guesses[0].correctAnswer)"
        }
    }

}
