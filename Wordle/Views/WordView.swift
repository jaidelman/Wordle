//
//  WordView.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import SwiftUI

struct WordView: View {
    @StateObject var viewModel: WordViewModel
    
    var body: some View {
        HStack {
            ForEach(0 ..< viewModel.guess.count, id: \.self) { i in
                LetterView(viewModel: viewModel.guess[i])
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView(viewModel: createMockWordViewModel())
    }
    
    static func createMockWordViewModel() -> WordViewModel {
        let wordViewModel = WordViewModel(correctWord: "CHAOS")
        wordViewModel.updateGuess(index: 0, letter: "A")
        wordViewModel.updateGuess(index: 1, letter: "B")
        wordViewModel.updateGuess(index: 2, letter: "C")
        wordViewModel.updateGuess(index: 3, letter: "D")
        wordViewModel.updateGuess(index: 4, letter: "E")
        
        return wordViewModel
    }
}
