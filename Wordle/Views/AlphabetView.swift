//
//  AlphabetView.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import SwiftUI

struct AlphabetView: View {
    @StateObject var viewModel: AlphabetViewModel
    @Binding var currentGuessValue: String
    
    let rows = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        LazyVGrid(columns: rows, alignment: .center, spacing: 30) {
            ForEach(0 ..< viewModel.lettersCount, id: \.self) { i in
                AlphabetLetterView(viewModel: viewModel.getLetterViewModelAtIndex(i), currentGuessValue: $currentGuessValue)
            }
            BackspaceView(viewModel: LetterViewModel(letter: Letter(letter: "🔙", color: .backspace), isAlphabet: true), currentGuessValue: $currentGuessValue)
        }
    }
}

struct AlphabetView_Previews: PreviewProvider {
    static let alphabetViewModel = AlphabetViewModel()
    
    static var previews: some View {
        AlphabetView(viewModel: alphabetViewModel, currentGuessValue: Binding.constant("TEST"))
    }
}
