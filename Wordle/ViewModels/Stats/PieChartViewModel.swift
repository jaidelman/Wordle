//
//  PieChartViewModel.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-03-13.
//

import Foundation
import SwiftUI

class PieChartViewModel {
    var data: [PieChartData] = []
    let title: String = "Stats"
    let colors = [Color.orange, Color.red, Color.yellow, Color.green, Color.blue, Color.purple]
    let center: CGPoint
    
    init(center: CGPoint) {
        self.center = center
        
        //READ DATA
        data.append(PieChartData(label: "1", value: 1))
        data.append(PieChartData(label: "2", value: 2))
        data.append(PieChartData(label: "3", value: 3))
        data.append(PieChartData(label: "4", value: 4))
        data.append(PieChartData(label: "5", value: 5))
        data.append(PieChartData(label: "6", value: 6))
    }
    
    func normalizedValue(index: Int) -> Double {
        var total = 0.0
        self.data.forEach { data in
            total += data.value
        }
        return data[index].value/total
    }
    
    var pieSlices: [PieChartSliceViewModel] {
        var slices = [PieChartSliceViewModel]()
        data.enumerated().forEach {(index, data) in
            let value = normalizedValue(index: index)
            if slices.isEmpty    {
                slices.append(PieChartSliceViewModel(center: center, startDegree: 0, endDegree: value * 360, color: colors[index], label: data.label))
            } else {
                if let lastSlice = slices.last {
                    slices.append(PieChartSliceViewModel(center: center, startDegree: lastSlice.slice.endDegree, endDegree: (value * 360 + lastSlice.slice.endDegree), color: colors[index], label: data.label))
                }
            }
            
        }
        return slices
     }
}
