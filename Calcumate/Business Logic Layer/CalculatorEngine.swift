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
    
    private var historyLog: [MathematicalEquation] = []
    
    //MARK: - Display
    
    var displayText: String {
        return inputManager.displayText
    }
    
    // MARK: - Extra Functions
    
    mutating func clearPressed() {
        inputManager = MathInputManager()
    }
    
    mutating func negatePressed() {
        inputManager.negatePressed()
    }
    
    mutating func percentagePressed() {
        inputManager.percentagePressed()
    }
    
    // MARK: - Operations
    
    mutating func addPressed() {
        inputManager.addPressed()
    }
    
    mutating func subtractPressed() {
        inputManager.subtractPressed()
    }
    
    mutating func multiplyPressed() {
        inputManager.multiplyPressed()
    }
    
    mutating func dividePressed() {
        inputManager.dividePressed()
    }
    
    mutating func equalsPressed() {
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
}
