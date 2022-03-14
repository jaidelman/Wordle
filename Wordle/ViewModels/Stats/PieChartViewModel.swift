//
//  PieChartViewModel.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-03-13.
//

import Foundation
import SwiftUI

class PieChartViewModel {
    var slices: [PieChartSlice] = []
    var endTrims: [CGFloat] = []
    let colors: [Color] = [Color.orange, Color.red, Color.yellow, Color.green, Color.blue, Color.purple]
    
    init() {
        //READ DATA
        slices.append(PieChartSlice(label: "1", value: 1, color: colors[0]))
        slices.append(PieChartSlice(label: "2", value: 2, color: colors[1]))
        slices.append(PieChartSlice(label: "3", value: 3, color: colors[2]))
        slices.append(PieChartSlice(label: "4", value: 4, color: colors[3]))
        slices.append(PieChartSlice(label: "5", value: 5, color: colors[4]))
        slices.append(PieChartSlice(label: "6", value: 6, color: colors[5]))
        for (i, _) in slices.enumerated() {
            self.endTrims.append(getEndTrimAtIndex(i))
        }
    }
    
    func getEndTrimAtIndex(_ index: Int) -> CGFloat {
        var total = 0

        for i in 0 ..< slices.count {
            total += slices[i].value
        }

        let lastTrim: CGFloat = index != 0 ? endTrims[index - 1] : 0.0

        return CGFloat(slices[index].value) * (CGFloat(100)/CGFloat(total)/CGFloat(100)) + lastTrim
    }
}
