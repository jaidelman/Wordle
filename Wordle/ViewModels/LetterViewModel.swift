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
    var color: Color = Color.gray
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
    
    func setLetter(letter: Character?) {
        self.letter.letter = letter
    }

}
