//
//  PieChartSliceView.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-03-13.
//

import SwiftUI

struct PieChartSliceView: View {
    var viewModel: PieChartSliceViewModel
    
    var body: some View {
        viewModel.path
            .fill(viewModel.slice.color)
            .overlay(viewModel.path.stroke(Color.borderColor, lineWidth: 2))
    }
}

struct PieChartSlice_Previews: PreviewProvider {
    static let viewModel = PieChartSliceViewModel(center: CGPoint(x: 100, y: 200), startDegree: 30, endDegree: 80, color: .orange, label: "1")
    
    static var previews: some View {
        PieChartSliceView(viewModel: viewModel)
    }
 }
