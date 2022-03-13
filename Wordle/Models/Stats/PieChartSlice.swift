//
//  PieChartSlice.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-03-13.
//

import Foundation
import SwiftUI

struct PieChartSlice {
    var center: CGPoint
    var radius: CGFloat = 300
    var startDegree: Double
    var endDegree: Double
    var color:  Color
    var label: String
}
