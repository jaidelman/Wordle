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
    let colors: [Color] = [.pieMaxGreen, .pieGreenYellow, .pieYellowGreen, .pieLightOrange, .pieDarkOrange, .pieRed]
    
    init() {
        let keys = UserDefaults.Keys.self
        
        slices.append(PieChartSlice(value: getNumWinsForKey(keys.oneGuess), color: colors[0]))
        slices.append(PieChartSlice(value: getNumWinsForKey(keys.twoGuess), color: colors[1]))
        slices.append(PieChartSlice(value: getNumWinsForKey(keys.threeGuess), color: colors[2]))
        slices.append(PieChartSlice(value: getNumWinsForKey(keys.fourGuess), color: colors[3]))
        slices.append(PieChartSlice(value: getNumWinsForKey(keys.fiveGuess), color: colors[4]))
        slices.append(PieChartSlice(value: getNumWinsForKey(keys.sixGuess), color: colors[5]))
        
        for (i, _) in slices.enumerated() {
            self.endTrims.append(getEndTrimAtIndex(i))
        }
    }
    
    func getNumWinsForKey(_ key: String) -> Int {
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: key)
        
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
