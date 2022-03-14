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
    @State var gameOver: Bool = false
    
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
                    if currentGuess.count == 5 {
                        viewModel.submitGuess()
                        
                        if viewModel.currentGuessNumber <= 6 {
                            self.currentGuess = ""
                        }
                    }
                }
                .buttonStyle(RectangularButton(color: .correctGreen))
                .onChange(of: viewModel.correctGuess || viewModel.currentGuessNumber > 6) { _ in
                    withAnimation(.linear(duration: 0.8)) {
                        gameOver = true
                    }
                }
            }
            .padding()
            
            if gameOver {
                let gameOverViewModel = GameOverViewModel(game: viewModel.game)
                
                GameOverView(viewModel: gameOverViewModel)
                    .transition(.asymmetric(insertion: .fadeAndSlide, removal: .fadeAndSlide)).environmentObject(rootViewModel)
                    .onAppear() {
                        gameOverViewModel.updateUserStats()
                    }
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
