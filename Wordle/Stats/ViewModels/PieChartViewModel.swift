//
//  PieChartViewModel.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-03-13.
//

import Foundation
import SwiftUI

class PieChartViewModel: ObservableObject {
    @Published var currentAngles: [CGFloat] = []
    
    var slices: [PieChartSlice] = []
    let colors: [Color] = [.pieMaxGreen, .pieGreenYellow, .pieYellowGreen, .pieLightOrange, .pieDarkOrange, .pieRed]
    var total: Int = 0
    
    init() {
        self.calculateTotal()
        self.createSlices()
    }
    
    func animateAtIndex(_ index: Int) {
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            if self.currentAngles[index] < self.slices[index].endAngle {
                self.currentAngles[index] += 0.01
            } else {
                timer.invalidate()
                
                if index < 5 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.animateAtIndex(index + 1)
                    }
                }
            }
        }
    }
    
    private func getNumWinsForKey(_ key: String) -> Int {
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: key)
    }
    
    private func getEndTrim(value: Int, startPosition: CGFloat) -> CGFloat {
        return startPosition + (CGFloat(value) * CGFloat(100)/CGFloat(total)/CGFloat(100))
    }
    
    private func calculateTotal() {
        let keys = UserDefaults.Keys.self
        
        self.total += getNumWinsForKey(keys.oneGuess)
        self.total += getNumWinsForKey(keys.twoGuess)
        self.total += getNumWinsForKey(keys.threeGuess)
        self.total += getNumWinsForKey(keys.fourGuess)
        self.total += getNumWinsForKey(keys.fiveGuess)
        self.total += getNumWinsForKey(keys.sixGuess)
    }
    
    private func createSlices() {
        let keys = UserDefaults.Keys.self
        
        let oneGuessWins = getNumWinsForKey(keys.oneGuess)
        let oneGuessEndAngle = getEndTrim(value: oneGuessWins, startPosition: 0)
        self.slices.append(PieChartSlice(value: oneGuessWins, color: colors[0], startAngle: 0, endAngle: oneGuessEndAngle))
        self.currentAngles.append(0)
        
        let twoGuessWins = getNumWinsForKey(keys.twoGuess)
        let twoGuessEndAngle = getEndTrim(value: twoGuessWins, startPosition: oneGuessEndAngle)
        self.slices.append(PieChartSlice(value: twoGuessWins, color: colors[1], startAngle: oneGuessEndAngle, endAngle: twoGuessEndAngle))
        self.currentAngles.append(oneGuessEndAngle)
        
        let threeGuessWins = getNumWinsForKey(keys.threeGuess)
        let threeGuessEndAngle = getEndTrim(value: threeGuessWins, startPosition: twoGuessEndAngle)
        self.slices.append(PieChartSlice(value: threeGuessWins, color: colors[2], startAngle: twoGuessEndAngle, endAngle: threeGuessEndAngle))
        self.currentAngles.append(twoGuessEndAngle)
        
        let fourGuessWins = getNumWinsForKey(keys.fourGuess)
        let fourGuessEndAngle = getEndTrim(value: fourGuessWins, startPosition: threeGuessEndAngle)
        self.slices.append(PieChartSlice(value: fourGuessWins, color: colors[3], startAngle: threeGuessEndAngle, endAngle: fourGuessEndAngle))
        self.currentAngles.append(threeGuessEndAngle)
        
        let fiveGuessWins = getNumWinsForKey(keys.fiveGuess)
        let fiveGuessEndAngle = getEndTrim(value: fiveGuessWins, startPosition: fourGuessEndAngle)
        self.slices.append(PieChartSlice(value: fiveGuessWins, color: colors[4], startAngle: fourGuessEndAngle, endAngle: fiveGuessEndAngle))
        self.currentAngles.append(fourGuessEndAngle)
        
        let sixGuessWins = getNumWinsForKey(keys.sixGuess)
        let sixGuessEndAngle = getEndTrim(value: sixGuessWins, startPosition: fiveGuessEndAngle)
        self.slices.append(PieChartSlice(value: sixGuessWins, color: colors[5], startAngle: fiveGuessEndAngle, endAngle: sixGuessEndAngle))
        self.currentAngles.append(fiveGuessEndAngle)
    }
}
