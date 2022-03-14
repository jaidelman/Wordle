//
//  WordViewModel.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import Foundation

class WordViewModel: ObservableObject {
    let correctAnswer: String
    @Published var word: Word = Word()
    
    init(correctAnswer: String) {
        self.correctAnswer = correctAnswer
        
        for _ in 0 ..< Word.wordLength {
            self.word.guess.append(LetterViewModel(letter: Letter(color: .gray), isAlphabet: false))
        }
    }
    
    var guessCount: Int {
        return word.guess.count
    }
    
    func getLetterViewModelAtIndex(_ index: Int) -> LetterViewModel {
        return word.guess[index]
    }
    
    func updateGuess(index: Int, letter: Character?) {
        word.guess[index].setLetter(letter)
    }
    
    func getGuess() -> String {
        var string = ""
        
        for letter in word.guess {
            string.append(letter.character)
        }
        
        return string
    }
    
    func makeGuess() -> Bool {
        if getGuess() == correctAnswer {
            for letter in word.guess {
                letter.setColor(.correctGreen)
            }
            return true
        }
        
        for (i, letter) in word.guess.enumerated() {
            if letter.character == String(correctAnswer[i]) {
                letter.setColor(.correctGreen)
            } else if correctAnswer.contains(letter.character) {
                letter.setColor(.correctYellow)
            }
        }
        
        return false
    }
}
