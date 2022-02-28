//
//  AlphabetViewModel.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import Foundation
import SwiftUI

class AlphabetViewModel: ObservableObject {
    let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    @Published var letterViewModels: [LetterViewModel] = []
    
    init() {
        for letter in letters {
            let letterObj = Letter(letter: letter, color: .gray)
            let letterViewModel = LetterViewModel(letter: letterObj)
            letterViewModels.append(letterViewModel)
        }
    }
    
    func makeGuess(guess: String, correctAnswer: String) {
        for (i, character) in guess.enumerated() {
            for letter in letterViewModels {
                
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
