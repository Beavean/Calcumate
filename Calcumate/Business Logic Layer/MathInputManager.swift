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
    
    private let groupingSymbol = Locale.current.groupingSeparator ?? ","
    private let decimalSymbol = Locale.current.decimalSeparator ?? "."
    private let minusSymbol = "-"
    private let errorMessage = "Error"
    
    //MARK: - Mathematical Equation
    
    private(set) var mathematicalEquation = MathematicalEquation(leftSide: .zero)
    private var isEnteringDecimal = false
    
    //MARK: - Display
    
    var displayText = ""
    
    //MARK: - Equation Wrapper
    
    var leftSide: Decimal {
        get {
            return mathematicalEquation.leftSide
        }
        set {
            mathematicalEquation.leftSide = newValue
            displayText = formatDisplay(mathematicalEquation.leftSide)
        }
    }
    
    var rightSide: Decimal? {
        get {
            return mathematicalEquation.rightSide
        }
        set {
            mathematicalEquation.rightSide = newValue
            displayText = formatDisplay(mathematicalEquation.rightSide)
        }
    }
    var result: Decimal? {
        get {
            return mathematicalEquation.result
        }
        set {
            mathematicalEquation.result = newValue
            displayText = formatDisplay(mathematicalEquation.result)
        }
    }
    
    func generatePrintout() -> String {
        return mathematicalEquation.generatePrintout()
    }
    
    //MARK: - Initialiser
    
    init() {
        displayText = formatDisplay(mathematicalEquation.leftSide)
    }
    
    init(from mathInputManager: MathInputManager) {
        leftSide = mathInputManager.result ?? Decimal(0)
    }
    
    //MARK: - Extra Functions
    
    mutating func negatePressed() {
        guard isCompleted == false else { return }
        switch operandSide {
        case .leftSide:
            mathematicalEquation.negateLeftSide()
            addNegateSymbolToDisplay(mathematicalEquation.leftSide)
        case .rightSide:
            mathematicalEquation.negateRightSide()
            addNegateSymbolToDisplay(mathematicalEquation.rightSide)
        }
    }
    
    private mutating func addNegateSymbolToDisplay(_ decimal: Decimal?) {
        guard let decimal = decimal else { return }
        let isNegativeValue = decimal < 0 ? true : false
        if isNegativeValue {
            displayText.addPrefixIfNeeded(minusSymbol)
        } else {
            displayText.removePrefixIfNeeded(minusSymbol)
        }
    }
    
    mutating func percentagePressed() {
        guard isCompleted == false else { return }
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
        guard isCompleted == false else { return }
        mathematicalEquation.operation = .add
        startEditingRightSide()
    }
    
    mutating func subtractPressed() {
        guard isCompleted == false else { return }
        mathematicalEquation.operation = .subtract
        startEditingRightSide()
    }
    
    mutating func multiplyPressed() {
        guard isCompleted == false else { return }
        mathematicalEquation.operation = .multiply
        startEditingRightSide()
    }
    
    mutating func dividePressed() {
        guard isCompleted == false else { return }
        mathematicalEquation.operation = .divide
        startEditingRightSide()
    }
    
    mutating func execute() {
        guard isCompleted == false else { return }
        mathematicalEquation.execute()
        displayText = formatDisplay(mathematicalEquation.result)
    }
    
    //MARK: - Editing Right Side
    
    private mutating func startEditingRightSide() {
        operandSide = .rightSide
        isEnteringDecimal = false
    }
    
    // MARK: - Number Input
    
    mutating func decimalPressed() {
        isEnteringDecimal = true
        displayText = appendDecimalPointIfNeeded(displayText)
    }
    
    private func appendDecimalPointIfNeeded(_ string: String) -> String {
        if string.contains(decimalSymbol) {
            return string
        }
        return string.appending(decimalSymbol)
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
        guard isEnteringDecimal == false else { return appendNewDecimalNumber(number) }
        let stringInput = String(number)
        var newString = previousInput.isZero ? "" : displayText
        newString.append(stringInput)
        newString = newString.replacingOccurrences(of: groupingSymbol, with: "")
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = .decimal
        guard let convertedNumber = formatter.number(from: newString) else { return (.nan, errorMessage) }
        let newNumber = convertedNumber.decimalValue
        let newDisplayText = formatDisplay(newNumber)
        return (newNumber, newDisplayText)
    }
    
    private func appendNewDecimalNumber(_ number: Int) -> (number: Decimal, displayText: String) {
        let stringInput = String(number)
        let newDisplayText = displayText.appending(stringInput)
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = .decimal
        guard let convertedNumber = formatter.number(from: newDisplayText) else { return (.nan, errorMessage) }
        let newNumber = convertedNumber.decimalValue
        return (newNumber, newDisplayText)
    }
    
    //MARK: - Display Formatting
    
    private func formatDisplay(_ decimal: Decimal?) -> String {
        guard let decimal = decimal, decimal.isNaN == false else { return errorMessage }
        return decimal.formatted()
    }
    
    //MARK: - Computed Properties
    
    var isCompleted: Bool {
        return mathematicalEquation.executed
    }
    
    //MARK: - Copy & Paste
    
    mutating func pasteIn(_ decimal: Decimal) {
        switch operandSide {
        case .leftSide:
            mathematicalEquation.leftSide = decimal
        case .rightSide:
            mathematicalEquation.rightSide = decimal
        }
        displayText = formatDisplay(decimal)
    }
}
