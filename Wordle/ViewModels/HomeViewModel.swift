//
//  HomeViewModel.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-03-08.
//

import SwiftUI

class HomeViewModel {
    var letterViewModels: [LetterViewModel] = []
    
    init() {
        let word = "WORDLE"
        let colors: [Color] = [.correctYellow, .gray, .correctGreen, .correctGreen, .correctYellow, .gray]
        
        for (i, letter) in word.enumerated() {
            let letter = Letter(letter: letter, color: colors[i])
            let viewModel = LetterViewModel(letter: letter, isAlphabet: false)
            letterViewModels.append(viewModel)
        }
    }
    
    var letterCount: Int {
        return letterViewModels.count
    }
    
    func getLetterAtIndex(_ index: Int) -> LetterViewModel {
        return letterViewModels[index]
    }
}
