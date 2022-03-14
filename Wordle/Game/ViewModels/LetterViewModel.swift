//
//  LetterViewModel.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import Foundation
import UIKit
import SwiftUI

class LetterViewModel: ObservableObject {
    @Published private var letter: Letter

    private var viewSideLength: CGFloat
    private var viewFontSize: CGFloat
    private var viewCornerRadius: CGFloat
    
    init(letter: Letter, isAlphabet: Bool) {
        self.letter = letter
        self.viewSideLength = isAlphabet ? UIScreen.main.bounds.width/10 : UIScreen.main.bounds.width/6
        self.viewFontSize = isAlphabet ? 30 : 40
        self.viewCornerRadius = isAlphabet ? 8 : 0
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
    
    var sideLength: CGFloat {
        return viewSideLength
    }
    
    var fontSize: CGFloat {
        return viewFontSize
    }
    
    var cornerRadius: CGFloat {
        return viewCornerRadius
    }
    
    func setLetter(_ letter: Character?) {
        self.letter.letter = letter
    }

    func setColor(_ color: Color) {
        self.letter.color = color
    }
}
