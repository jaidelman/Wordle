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
    
    static var pieMaxGreen: Color {
        return Color(red: 0.38, green: 0.55, blue: 0.28)
    }
    
    static var pieGreenYellow: Color {
        return Color(red: 0.68, green: 0.81, blue: 0.42)
    }
    
    static var pieYellowGreen: Color {
        return Color(red: 0.94, green: 0.91, blue: 0.56)
    }
    
    static var pieLightOrange: Color {
        return Color(red: 0.92, green: 0.82, blue: 0.58)
    }
    
    static var pieDarkOrange: Color {
        return Color(red: 0.89, green: 0.71, blue: 0.59)
    }
    
    static var pieRed: Color {
        return Color(red: 0.85, green: 0.51, blue: 0.62)
    }

}
