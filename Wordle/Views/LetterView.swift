//
//  LetterView.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import SwiftUI

struct LetterView: View {
    @StateObject var viewModel: LetterViewModel
    
    var body: some View {
        Text(viewModel.character)
            .foregroundColor(.white)
            .font(.system(size: 40))
            .background(Rectangle()
                            .fill(viewModel.color)
                            .frame(width: UIScreen.main.bounds.width/6, height: UIScreen.main.bounds.width/6)
                            .border(.black, width: 2)
                        )
    }
}

struct LetterView_Previews: PreviewProvider {
    static var previews: some View {
        let letter = Letter(letter: "a", color: .gray)
        LetterView(viewModel: LetterViewModel(letter: letter))
    }
}
