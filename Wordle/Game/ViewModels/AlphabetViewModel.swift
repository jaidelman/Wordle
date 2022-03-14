//
//  AlphabetViewModel.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import Foundation
import SwiftUI

class AlphabetViewModel: ObservableObject {
    @Published var alphabet: Alphabet = Alphabet()
    
    init() {
        for letter in alphabet.letters {
            let letterObj = Letter(letter: letter, color: .gray)
            let letterViewModel = LetterViewModel(letter: letterObj, isAlphabet: true)
            alphabet.letterViewModels.append(letterViewModel)
        }
    }
    
    var lettersCount: Int {
        return alphabet.letterViewModels.count
    }
    
    func getLetterViewModelAtIndex(_ index: Int) -> LetterViewModel {
        return alphabet.letterViewModels[index]
    }
    
    func makeGuess(guess: String, correctAnswer: String) {
        for (i, character) in guess.enumerated() {
            for letter in alphabet.letterViewModels {
                
                if String(character) == letter.character {
                    if letter.character == String(correctAnswer[i]) {
                        letter.setColor(.correctGreen)
                    } else if correctAnswer.contains(letter.character) {
                        letter.setColor(.correctYellow)
                    } else {
                        letter.setColor(.borderColor)
                    }
                    break
                }
                
            }
        }
    }
}
