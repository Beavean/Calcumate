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
    
    //MARK: - Constants
    
    let groupingSymbol = Locale.current.groupingSeparator ?? ","
    
    //MARK: - Mathematical Equation
    
    private(set) var mathematicalEquation = MathematicalEquation(leftSide: .zero)
    
    //MARK: - Display
    
    var displayText = ""
    
    //MARK: - Initialiser
    
    init() {
        displayText = formatDisplay(mathematicalEquation.leftSide)
    }
    
    //MARK: - Extra Functions
    
    mutating func negatePressed() {
        switch operandSide {
        case .leftSide:
            mathematicalEquation.negateLeftSide()
            displayText = formatDisplay(mathematicalEquation.leftSide)
        case .rightSide:
            mathematicalEquation.negateRightSide()
            displayText = formatDisplay(mathematicalEquation.rightSide)
        }
    }
    
    mutating func percentagePressed() {
        switch operandSide {
        case .leftSide:
            mathematicalEquation.percentageLeftSide()
            displayText = formatDisplay(mathematicalEquation.leftSide)
        case .rightSide:
            mathematicalEquation.percentageRightSide()
            displayText = formatDisplay(mathematicalEquation.rightSide)
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
        displayText = formatDisplay(mathematicalEquation.result)
    }
    
    // MARK: - Number Input
    
    mutating func decimalPressed() {
        
    }
    
    mutating func numberPressed(_ number: Int) {
        guard number >= -9, number <= 9 else { return }
        switch operandSide {
        case .leftSide:
            let tuple = appendNewNumber(number, previousInput: mathematicalEquation.leftSide)
            mathematicalEquation.leftSide = tuple.number
            displayText = tuple.displayText
        case .rightSide:
            let tuple = appendNewNumber(number, previousInput: mathematicalEquation.rightSide ?? .zero)
            mathematicalEquation.rightSide = tuple.number
            displayText = tuple.displayText
        }
    }
    
    private func appendNewNumber(_ number: Int, previousInput: Decimal) -> (number: Decimal, displayText: String) {
       let stringInput = String(number)
        var newString = previousInput.isZero ? "" : displayText
        newString.append(stringInput)
        newString = newString.replacingOccurrences(of: groupingSymbol, with: "")
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = .decimal
        guard let convertedNumber = formatter.number(from: newString) else { return (.nan, "Error") }
        let newNumber = convertedNumber.decimalValue
        let newDisplayText = formatDisplay(newNumber)
        return (newNumber, newDisplayText)
    }
    
    //MARK: - Display Formatting
    
    private func formatDisplay(_ decimal: Decimal?) -> String {
        guard let decimal = decimal else { return "Error" }
        return decimal.formatted()
    }
    
}
