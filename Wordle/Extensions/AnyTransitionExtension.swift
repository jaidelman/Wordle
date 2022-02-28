//
//  AnyTransitionExtension.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-28.
//

import SwiftUI

extension AnyTransition {
    static var fadeAndSlide: AnyTransition {
        AnyTransition.opacity.combined(with: .move(edge: .top))
    }
}
