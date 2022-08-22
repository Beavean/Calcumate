//
//  String+Numbers.swift
//  Calcumate
//
//  Created by Beavean on 22.08.2022.
//

import Foundation

extension String {
    
    var doubleValue: Double? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.number(from: self)?.doubleValue
    }
}
