//
//  LetterViewModel.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import Foundation
import UIKit
import SwiftUI

struct Letter {
    var letter: Character?
    var color: Color
}

class LetterViewModel: ObservableObject {
    @Published private var letter: Letter
    
    init(letter: Letter) {
        self.letter = letter
    }
    
    var character: String {
        if let letter = letter.letter {
            return letter.uppercased()
        } else {
            return " "
        }
    }
    
    var color: Color {
        return letter.color
    }
    
    func setLetter(_ letter: Character?) {
        self.letter.letter = letter
    }

    func setColor(_ color: Color) {
        self.letter.color = color
    }
}
