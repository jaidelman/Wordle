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
            Text("Stats")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.black)
            Spacer()
            Text("Wins: \(viewModel.numWins)")
                .foregroundColor(.black)
            BarChartView(viewModel: BarChartViewModel(percent: viewModel.winPercent))
            Text("Games: \(viewModel.numGames)")
                .foregroundColor(.black)
            Spacer()
            PieChartView(viewModel: PieChartViewModel())
            Spacer()
            Button("Play Again") {
                rootViewModel.updateCurrentView(.game)
            }
            .buttonStyle(RectangularButton(color: .correctGreen, textColor: .black, borderColor: .black))
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.winner)
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
            .preferredColorScheme(.dark)
    }
}
