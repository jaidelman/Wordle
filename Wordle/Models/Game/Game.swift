//
//  Game.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-28.
//

import Foundation

struct Game {
    var alphabetViewModel: AlphabetViewModel = AlphabetViewModel()
    var currentGuessNumber: Int = 1
    var guesses: [WordViewModel] = []
    var correctGuess: Bool = false
}
