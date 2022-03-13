//
//  StatsView.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-03-13.
//

import SwiftUI

struct StatsView: View {
    let viewModel = StatsViewModel()
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        VStack {
            Spacer()
            GeometryReader { geometry in
                PieChartView(viewModel: PieChartViewModel(center: CGPoint(x: geometry.frame(in: .local).midX, y: geometry.frame(in:  .local).midY)))
            }
            Button("Play Again") {
                rootViewModel.updateGameViewModel()
            }
            .buttonStyle(RectangularButton(color: .winnerButton, textColor: .textColor, borderColor: .black))
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.textColor)
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
