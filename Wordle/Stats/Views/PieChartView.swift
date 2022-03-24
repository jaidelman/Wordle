//
//  PieChartView.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-03-13.
//

import SwiftUI

struct PieChartView: View {
    @StateObject var viewModel: PieChartViewModel
    @State var selectedIndex: Int? = nil
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0 ..< viewModel.slices.count) { i in
                        Circle()
                        .trim(from: viewModel.slices[i].startAngle, to: viewModel.currentAngles[i])
                            .stroke(viewModel.slices[i].color,lineWidth: 50)
                            .scaleEffect(i == selectedIndex ? 1.1 : 1.0)
                            .animation(.spring(), value: selectedIndex)
                            .rotationEffect(.degrees(-90))
                            .onTapGesture {
                                selectedIndex = i
                            }
                            .onAppear {
                                if i == 0 {
                                    viewModel.animateAtIndex(i)
                                }
                            }
                }
                .frame(width: 200, height: 250)

                if let selectedIndex = selectedIndex {
                    Text("\(viewModel.slices[selectedIndex].value)")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.black)
                }
            }
            .padding(.bottom, 20)
            Text("# of Guesses")
                .foregroundColor(.black)
            HStack {
                ForEach( 0 ..< viewModel.slices.count/2, id: \.self ){ i in
                    ZStack {
                        RoundedRectangle(cornerRadius: 0)
                            .fill(viewModel.colors[i])
                            .frame(width: 50, height: 50)
                        Text("\(i+1)")
                            .foregroundColor(.black)
                    }
                }
            }
            HStack {
                ForEach( viewModel.slices.count/2 ..< viewModel.slices.count, id: \.self ){ i in
                    ZStack {
                        RoundedRectangle(cornerRadius: 0)
                            .fill(viewModel.colors[i])
                            .frame(width: 50, height: 50)
                        Text("\(i+1)")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct PieChartView_Previews: PreviewProvider {

    static var previews: some View {
        let viewModel = PieChartViewModel()
        
        PieChartView(viewModel: viewModel)
    }
}
