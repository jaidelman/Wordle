//
//  BarChartView.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-03-13.
//

import SwiftUI

struct BarChartView: View {
    @StateObject var viewModel: BarChartViewModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.borderColor
                .frame(width: UIScreen.main.bounds.width * 0.8, height: 2)
            Color.borderColor
                .frame(width: 2, height: 20)
            Color.borderColor
                .frame(width: 2, height: 20)
            Color.borderColor
                .frame(width: 2, height: 20)
                .offset(x: UIScreen.main.bounds.width * 0.8)
            Color.correctGreen
                .frame(width: (UIScreen.main.bounds.width * 0.8 * viewModel.percent), height: 12)
                .offset(x: 2)
        }
        .onAppear {
            viewModel.animate()
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(viewModel: BarChartViewModel(percent: 0.8))
    }
}
