//
//  WinnerView.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-28.
//

import SwiftUI

struct WinnerView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    @StateObject var viewModel: WinnerViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Text("You won in \(viewModel.numGuesses) \(viewModel.numGuesses == 1 ? "guess" : "guesses")!")
                .foregroundColor(.black)
            Spacer()
            Button("Continue") {
                rootViewModel.updateCurrentView(.stats)
            }
            .buttonStyle(RectangularButton(color: .winnerButton, textColor: .textColor, borderColor: .black))
            Spacer()
        }
        .background(
            ZStack {
                Color.winner.cornerRadius(10)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.borderColor, lineWidth: 2)
                    .frame(width: viewModel.width, height: viewModel.height)
            }.padding()
        )
        .frame(width: viewModel.width, height: viewModel.height)
        .opacity(0.95)
    }
}

struct WinnerView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = WinnerViewModel(numberOfGuesses: 3)
        WinnerView(viewModel: viewModel)
    }
}