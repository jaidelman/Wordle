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
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(textColor)
            .padding()
            .background(
                ZStack {
                    color.cornerRadius(8)
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.black, lineWidth: 2)
                })
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
    
}
