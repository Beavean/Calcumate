//
//  MathInputManager.swift
//  Calcumate
//
//  Created by Beavean on 18.08.2022.
//

import Foundation

struct MathInputManager {
    
    //MARK: - Operand Editing Side
    
    enum OperandSide {
        case leftSide
        case rightSide
    }
    
    private var operandSide = OperandSide.leftSide
    
    //MARK: - Mathematical Equation
    
    private(set) var mathematicalEquation = MathematicalEquation(leftSide: .zero)
    
    //MARK: - Display
    
    var displayText = ""
    
    //MARK: - Initialiser
    
    init() {
        displayText = mathematicalEquation.leftSide.formatted()
    }
    
    //MARK: - Extra Functions
    
    mutating func negatePressed() {
        switch operandSide {
        case .leftSide:
            mathematicalEquation.negateLeftSide()
            displayText = mathematicalEquation.leftSide.formatted()
        case .rightSide:
            mathematicalEquation.negateRightSide()
            displayText = mathematicalEquation.rightSide?.formatted() ?? "Error"
        }
    }
    
    mutating func percentagePressed() {
        switch operandSide {
        case .leftSide:
            mathematicalEquation.percentageLeftSide()
            displayText = mathematicalEquation.leftSide.formatted()
        case .rightSide:
            mathematicalEquation.percentageRightSide()
            displayText = mathematicalEquation.rightSide?.formatted() ?? "Error"
        }
    }
    
    // MARK: - Operations
    
    mutating func addPressed() {
        mathematicalEquation.operation = .add
        operandSide = .rightSide
    }
    
    mutating func subtractPressed() {
        mathematicalEquation.operation = .subtract
        operandSide = .rightSide
    }
    
    mutating func multiplyPressed() {
        mathematicalEquation.operation = .multiply
        operandSide = .rightSide
    }
    
    mutating func dividePressed() {
        mathematicalEquation.operation = .divide
        operandSide = .rightSide
    }
    
    mutating func execute() {
        mathematicalEquation.execute()
        displayText = mathematicalEquation.result?.formatted() ?? "Error"
    }
    
    // MARK: - Number Input
    
    mutating func decimalPressed() {
        
    }
    
    mutating func numberPressed(_ number: Int) {
        let decimalValue = Decimal(number)
        displayText = decimalValue.formatted()
        switch operandSide {
        case .leftSide:
            mathematicalEquation.leftSide = decimalValue
        case .rightSide:
            mathematicalEquation.rightSide = decimalValue
        }
    }
    
}
