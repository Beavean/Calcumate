//
//  CalculatorEngine.swift
//  Calcumate
//
//  Created by Beavean on 18.08.2022.
//

import Foundation

struct CalculatorEngine {
    
    //MARK: - Input Manager
    
    private var inputManager = MathInputManager()
    
    //MARK: - Equation history
    
    private(set) var historyLog: [MathematicalEquation] = []
    
    //MARK: - Display
    
    var displayText: String {
        return inputManager.displayText
    }
    
    // MARK: - Extra Functions
    
    mutating func clearPressed() {
        inputManager = MathInputManager()
    }
    
    mutating func negatePressed() {
        guard inputManager.isCompleted == false else { return }
        inputManager.negatePressed()
    }
    
    mutating func percentagePressed() {
        guard inputManager.isCompleted == false else { return }
        inputManager.percentagePressed()
    }
    
    // MARK: - Operations
    
    mutating func addPressed() {
        guard inputManager.isCompleted == false else { return }
        inputManager.addPressed()
    }
    
    mutating func subtractPressed() {
        guard inputManager.isCompleted == false else { return }
        inputManager.subtractPressed()
    }
    
    mutating func multiplyPressed() {
        guard inputManager.isCompleted == false else { return }
        inputManager.multiplyPressed()
    }
    
    mutating func dividePressed() {
        guard inputManager.isCompleted == false else { return }
        inputManager.dividePressed()
    }
    
    mutating func equalsPressed() {
        guard inputManager.isCompleted == false else { return }
        inputManager.execute()
        historyLog.append(inputManager.mathematicalEquation)
        printEquationToConsole()
    }
    
    // MARK: - Number Input
    
    mutating func decimalPressed() {
        inputManager.decimalPressed()
    }
    
    mutating func numberPressed(_ number: Int) {
        inputManager.numberPressed(number)
    }
    
    //MARK: - Console
    
    private func printEquationToConsole() {
        print("Equation: " + inputManager.mathematicalEquation.generatePrintout())
    }
    
    //MARK: - History Log
    
    private mutating func clearHistory() {
        historyLog = []
    }
    
    //MARK: - Copy & Paste
    
    mutating func pasteInNumber(from decimal: Decimal) {
        if inputManager.isCompleted {
            inputManager = MathInputManager()
        }
        inputManager.pasteIn(decimal)
    }
}
