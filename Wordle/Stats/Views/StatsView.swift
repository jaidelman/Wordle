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
            Spacer()
            Text("Wins: 10")
            BarChartView(percent: 0.8)
            Text("Games: 12")
            Spacer()
            PieChartView(viewModel: PieChartViewModel())
            Spacer()
            Button("Play Again") {
                rootViewModel.updateCurrentView(.game)
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
