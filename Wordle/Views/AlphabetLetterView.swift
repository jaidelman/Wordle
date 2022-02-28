//
//  AlphabetLetterView.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import SwiftUI

struct AlphabetLetterView: View {
    @StateObject var viewModel: LetterViewModel
    @Binding var currentGuessValue: String
    
    var body: some View {
        LetterView(viewModel: viewModel, isForGuess: false)
            .onTapGesture {
                if currentGuessValue.count <= WordViewModel.wordLength - 1 {
                    currentGuessValue += self.viewModel.character
                }
            }
    }
}

struct AlphabetLetterView_Previews: PreviewProvider {
    static let viewModel = LetterViewModel(letter: Letter(letter: "A", color: .gray))
                                                   
    static var previews: some View {
        AlphabetLetterView(viewModel: viewModel, currentGuessValue: Binding.constant("TEST"))
    }
}
