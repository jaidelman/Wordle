//
//  BackspaceView.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import SwiftUI

struct BackspaceView: View {
    @StateObject var viewModel: LetterViewModel
    @Binding var currentGuessValue: String
    
    var body: some View {
        LetterView(viewModel: viewModel, isForGuess: false)
            .onTapGesture {
                if currentGuessValue.count > 0 {
                    currentGuessValue.remove(at: currentGuessValue.index(before: currentGuessValue.endIndex))
                }
            }
    }
}

struct BackspaceView_Previews: PreviewProvider {
    static let viewModel = LetterViewModel(letter: Letter(letter: "A", color: .gray))
                                                   
    static var previews: some View {
        BackspaceView(viewModel: viewModel, currentGuessValue: Binding.constant("TEST"))
    }
}
