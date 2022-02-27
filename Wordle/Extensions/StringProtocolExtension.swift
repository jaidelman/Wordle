//
//  StringProtocolExtension.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-02-27.
//

import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
