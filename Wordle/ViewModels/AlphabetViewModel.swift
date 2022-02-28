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
}
