//
//  RectangularButton.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import SwiftUI

struct RectangularButton: ButtonStyle {
    
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
    .foregroundColor(.black)
    .padding()
    .background(Color.green.cornerRadius(8))
    .scaleEffect(configuration.isPressed ? 0.95 : 1)
  }
    
}
