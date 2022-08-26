//
//  Array+SafeAccess.swift
//  Calcumate
//
//  Created by Beavean on 25.08.2022.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        return self.indices ~= index ? self[index] : nil
    }
}
