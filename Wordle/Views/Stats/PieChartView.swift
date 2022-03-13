//
//  PieChartView.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-03-13.
//

import SwiftUI

struct PieChartView: View {
    let viewModel: PieChartViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Text(viewModel.title)
                .font(.system(size: 30, weight: .bold))
            ZStack {
                ZStack  {
                    ForEach( 0 ..< viewModel.data.count ){ i in
                        let sliceViewModel = viewModel.pieSlices[i]
                        PieChartSliceView(viewModel: sliceViewModel)
                    }
                }
            }
            .offset(x: 80)
            
            Text("# of Guesses")
            VStack {
                HStack {
                    ForEach( 0 ..< viewModel.data.count/2 ){ i in
                        ZStack {
                            RoundedRectangle(cornerRadius: 0)
                                .fill(viewModel.pieSlices[i].slice.color)
                                .frame(width: 50, height: 50)
                            Text(viewModel.pieSlices[i].slice.label)
                        }
                    }
                }
                HStack {
                    ForEach( viewModel.data.count/2 ..< viewModel.data.count ){ i in
                        ZStack {
                            RoundedRectangle(cornerRadius: 0)
                                .fill(viewModel.pieSlices[i].slice.color)
                                .frame(width: 50, height: 50)
                            Text(viewModel.pieSlices[i].slice.label)
                        }
                    }
                }
            }
        }
    }
}

struct PieChartView_Previews: PreviewProvider {

    static var previews: some View {
        GeometryReader { geometry in
            PieChartView(viewModel: PieChartViewModel(center: CGPoint(x: geometry.frame(in: .local).midX, y: geometry.frame(in:  .local).midY)))
        }
    }
}
