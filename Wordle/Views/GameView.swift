//
//  GameView.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import SwiftUI

struct GameView: View {
    
    enum Field: Hashable {
        case textEditor
    }
    
    @StateObject var viewModel: GameViewModel
    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack(spacing: 30) {
            ForEach(0 ..< viewModel.guesses.count, id: \.self) { i in
                WordView(viewModel: viewModel.guesses[i])
                    .frame(maxWidth: .infinity)
            }
            .onTapGesture {
                focusedField = nil
            }
            
            TextEditor(text: $viewModel.currentGuess)
                .focused($focusedField, equals: .textEditor)
                .foregroundColor(.white)
            Spacer()
        }
        .padding()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: createMockGameViewModel())
    }
    
    static func createMockGameViewModel() -> GameViewModel {
        return GameViewModel(correctWord: "CHAOS")
    }
}
