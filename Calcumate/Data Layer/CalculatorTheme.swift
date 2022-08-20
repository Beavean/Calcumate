//
//  CalculatorTheme.swift
//  Calcumate
//
//  Created by Beavean on 18.08.2022.
//

import Foundation

enum StatusBarStyle {
    case light
    case dark
}

struct CalculatorTheme {
    let backgroundColor: String
    let displayColor: String
    
    let extraFunctionColor: String
    let extraFunctionTitleColor: String
    
    let operationColor: String
    let operationTitleColor: String
    
    let pinPadColor: String
    let pinPadTitleColor: String
    
    let statusBarStyle: StatusBarStyle
}
