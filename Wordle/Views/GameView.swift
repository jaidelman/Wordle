//
//  GameView.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import SwiftUI

struct GameView: View {
    @StateObject var viewModel: GameViewModel
    @State var currentGuess: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            ForEach(0 ..< viewModel.guesses.count, id: \.self) { i in
                WordView(viewModel: viewModel.guesses[i])
                    .frame(maxWidth: .infinity)
            }
            
            AlphabetView(viewModel: viewModel.alphabetViewModel, currentGuessValue: $currentGuess)
                .onChange(of: currentGuess) { guess in
                    viewModel.updateGuess(guess: guess)
                }
            
            
            Button("Submit") {
                if currentGuess.count == 5 && viewModel.currentGuessNumber < 6 {
                    viewModel.submitGuess()
                    currentGuess = ""
                }
            }
            .buttonStyle(RectangularButton())
        }
        .padding()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel(correctWord: "CHAOS"))
    }
}
