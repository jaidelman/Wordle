//
//  BarChartViewModel.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-03-14.
//

import Foundation
import SwiftUI

class BarChartViewModel: ObservableObject {
    @Published var percent: CGFloat = 0
    var maxPercent: CGFloat
    
    init(percent: CGFloat) {
        self.maxPercent = percent
    }
    
    func animate() {
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            if self.percent < self.maxPercent {
                self.percent += 0.01
            } else {
                timer.invalidate()
            }
        }
    }
}
