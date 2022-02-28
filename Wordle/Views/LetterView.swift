//
//  LetterView.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import SwiftUI

struct LetterView: View {
    @StateObject var viewModel: LetterViewModel
    
    private let sideLength: CGFloat
    private let fontSize: CGFloat
    private let cornerRadius: CGFloat

    init(viewModel: LetterViewModel, isForGuess: Bool) {
        _viewModel = StateObject(wrappedValue: viewModel)
        
        self.sideLength = isForGuess ? UIScreen.main.bounds.width/6 : UIScreen.main.bounds.width/10
        self.fontSize = isForGuess ? 40 : 30
        self.cornerRadius = isForGuess ? 0 : 8
    }
    
    var body: some View {
        Text(viewModel.character)
            .font(.system(size: fontSize))
            .foregroundColor(.textColor)
            .background(
                ZStack {
                    viewModel.color.cornerRadius(cornerRadius)
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.borderColor, lineWidth: 2)
                        .frame(width: sideLength, height: sideLength)
                })
            .animation(.easeIn(duration: 0.5), value: viewModel.color)
    }
}

struct LetterView_Previews: PreviewProvider {
    static var previews: some View {
        let letter = Letter(letter: "a", color: .gray)
        
        HStack {
            Spacer()
            LetterView(viewModel: LetterViewModel(letter: letter), isForGuess: true)
            Spacer()
            LetterView(viewModel: LetterViewModel(letter: letter), isForGuess: false)
            Spacer()
        }
    }
}
