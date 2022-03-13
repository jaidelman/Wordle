//
//  PieChartSliceViewModel.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-03-13.
//

import Foundation
import SwiftUI

class PieChartSliceViewModel {
    var slice: PieChartSlice
    
    init(center: CGPoint, startDegree: Double, endDegree: Double, color: Color, label: String) {
        self.slice = PieChartSlice(center: center, startDegree: startDegree, endDegree: endDegree, color: color, label: label)
    }
    
    var path: Path {
        var path = Path()
        path.addArc(center: slice.center, radius: slice.radius, startAngle: Angle(degrees: slice.startDegree), endAngle: Angle(degrees: slice.endDegree), clockwise: false)
        path.addLine(to: slice.center)
        path.closeSubpath()
        return path.applying(CGAffineTransform(scaleX: 0.6, y: 0.6))
     }
}
