//
//  ColorExtension.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-28.
//

import SwiftUI

extension Color {
    static var textColor: Color {
        return Color("TextColor")
    }
    
    static var borderColor: Color {
        return Color("BorderColor")
    }

    static var correctGreen: Color {
        return Color("CorrectGreenColor")
    }
    
    static var correctYellow: Color {
        return Color("CorrectYellowColor")
    }
    
    static var winner: Color {
        return Color("WinnerColor")
    }
    
    static var winnerButton: Color {
        return Color("WinnerButtonColor")
    }
    
    static var backspace: Color {
        return Color("BackspaceColor")
    }
}
