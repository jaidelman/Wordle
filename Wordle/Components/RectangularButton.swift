//
//  RectangularButton.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import SwiftUI

struct RectangularButton: ButtonStyle {
    let color: Color
    var textColor: Color = .black
    var borderColor: Color = .borderColor
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(textColor)
            .padding()
            .background(
                ZStack {
                    color.cornerRadius(8)
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(borderColor, lineWidth: 2)
                })
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
    
}
