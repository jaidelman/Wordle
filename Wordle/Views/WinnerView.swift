//
//  WinnerView.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-28.
//

import SwiftUI

struct WinnerView: View {
    private let width = UIScreen.main.bounds.width/1.2
    private let height = UIScreen.main.bounds.height/4
    let numberOfGuesses: Int
    
    var body: some View {
        VStack {
            Spacer()
            Text("You won in \(numberOfGuesses) \(numberOfGuesses == 1 ? "guess" : "guesses")!")
            Spacer()
            Button("Play Again") {
                
            }
            .buttonStyle(RectangularButton(color: .blue, textColor: .white))
            Spacer()
        }
        .background(
            ZStack {
                Color.white.cornerRadius(10)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: 2)
                    .frame(width: width, height: height)
            }.padding()
        )
        .frame(width: width, height: height)
        .opacity(0.95)
    }
}

struct WinnerView_Previews: PreviewProvider {
    static var previews: some View {
        WinnerView(numberOfGuesses: 3)
    }
}
