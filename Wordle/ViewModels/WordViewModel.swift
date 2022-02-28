//
//  WordViewModel.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import Foundation

class WordViewModel: ObservableObject {
    static let wordLength: Int = 5
    private let correctWord: String
    
    @Published var guess: [LetterViewModel] = []
    
    init(correctWord: String) {
        self.correctWord = correctWord
        
        for _ in 0 ..< WordViewModel.wordLength {
            self.guess.append(LetterViewModel(letter: Letter(color: .gray)))
        }
    }
    
    func updateGuess(index: Int, letter: Character?) {
        guess[index].setLetter(letter)
    }
    
    private func getGuess() -> String {
        var string = ""
        
        for letter in guess {
            string.append(letter.character)
        }
        
        return string
    }
    
    func makeGuess() -> Bool {
        if getGuess() == correctWord {
            return true
        }
        
        for (i, letter) in guess.enumerated() {
            if letter.character == String(correctWord[i]) {
                letter.setColor(.green)
            } else if correctWord.contains(letter.character) {
                letter.setColor(.yellow)
            }
        }
        
        return false
    }
}
