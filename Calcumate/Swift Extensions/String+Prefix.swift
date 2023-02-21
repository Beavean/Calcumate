//
//  String+Prefix.swift
//  Calcumate
//
//  Created by Beavean on 19.08.2022.
//

import Foundation

extension String {
    mutating func addPrefixIfNeeded(_ prefix: String) {
        guard hasPrefix(prefix) == false else { return }
        self = prefix + self
    }

    mutating func removePrefixIfNeeded(_ prefix: String) {
        guard hasPrefix(prefix) == true else { return }
        self = replacingOccurrences(of: prefix, with: "")
    }
}
