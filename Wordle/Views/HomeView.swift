//
//  HomeView.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-03-08.
//

import SwiftUI

struct HomeView: View {
    let viewModel = HomeViewModel()
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                ForEach(0 ..< viewModel.letterCount, id:\.self) { i in
                    LetterView(viewModel: viewModel.getLetterAtIndex(i))
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
            }
            Spacer()
            Button("Start Game") {
                rootViewModel.updateCurrentView(.newGame)
            }
            .buttonStyle(RectangularButton(color: .correctGreen))
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.textColor)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
