//
//  GameView.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    @StateObject var viewModel: GameViewModel
    
    @State var currentGuess: String = ""
    @State var showWin: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                Spacer()
                ForEach(0 ..< viewModel.guessesCount, id: \.self) { i in
                    WordView(viewModel: viewModel.getGuessAtIndex(i))
                        .frame(maxWidth: .infinity)
                }
                
                AlphabetView(viewModel: viewModel.alphabetViewModel, currentGuessValue: $currentGuess)
                    .onChange(of: currentGuess) { guess in
                        viewModel.updateGuess(guess: guess)
                    }
                    .disabled(viewModel.correctGuess)
                
                
                Button("Submit") {
                    if currentGuess.count == 5 && viewModel.currentGuessNumber < 6 {
                        viewModel.submitGuess()
                        self.currentGuess = ""
                    }
                }
                .buttonStyle(RectangularButton(color: .correctGreen))
                .onChange(of: viewModel.correctGuess) { _ in
                    withAnimation(.linear(duration: 0.8)) {
                        showWin = true
                    }
                }
            }
            .padding()
            
            if showWin {
                let winnerViewModel = WinnerViewModel(numberOfGuesses: viewModel.currentGuessNumber - 1)
                WinnerView(viewModel: winnerViewModel)
                    .transition(.asymmetric(insertion: .fadeAndSlide, removal: .fadeAndSlide)).environmentObject(rootViewModel)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel())
        GameView(viewModel: GameViewModel()).preferredColorScheme(.dark)
    }
}