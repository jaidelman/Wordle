//
//  LetterView.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import SwiftUI

struct LetterView: View {
    @StateObject var viewModel: LetterViewModel
    
    var body: some View {
        Text(viewModel.character)
            .font(.system(size: viewModel.fontSize))
            .foregroundColor(.textColor)
            .background(
                ZStack {
                    viewModel.color.cornerRadius(viewModel.cornerRadius)
                    RoundedRectangle(cornerRadius: viewModel.cornerRadius)
                        .stroke(Color.borderColor, lineWidth: 2)
                        .frame(width: viewModel.sideLength, height: viewModel.sideLength)
                })
            .animation(.easeIn(duration: 0.5), value: viewModel.color)
    }
}

struct LetterView_Previews: PreviewProvider {
    static var previews: some View {
        let letter = Letter(letter: "a", color: .gray)
        
        HStack {
            Spacer()
            LetterView(viewModel: LetterViewModel(letter: letter, isAlphabet: false))
            Spacer()
            LetterView(viewModel: LetterViewModel(letter: letter, isAlphabet: true))
            Spacer()
        }
    }
}
