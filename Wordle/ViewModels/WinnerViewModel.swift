//
//  WinnerViewModel.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-28.
//

import SwiftUI

class WinnerViewModel: ObservableObject {
    @Published var winner: Winner
    
    private let viewWidth = UIScreen.main.bounds.width/1.2
    private let viewHeight = UIScreen.main.bounds.height/4
    
    init(numberOfGuesses: Int) {
        self.winner = Winner(numberOfGuesses: numberOfGuesses)
    }
    
    var width: CGFloat {
        return viewWidth
    }
    
    var height: CGFloat {
        return viewHeight
    }
    
    var numGuesses: Int {
        return winner.numberOfGuesses
    }
}
