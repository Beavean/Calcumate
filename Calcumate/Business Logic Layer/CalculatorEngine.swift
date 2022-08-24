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
        if inputManager.isReadyToExecute {
            executeMathInputController()
            populateFromResult()
        }
        if inputManager.isCompleted {
            populateFromResult()
        }
        inputManager.addPressed()
    }
    
    mutating func subtractPressed() {
        if inputManager.isReadyToExecute {
            executeMathInputController()
            populateFromResult()
        }
        if inputManager.isCompleted {
            populateFromResult()
        }
        inputManager.subtractPressed()
    }
    
    mutating func multiplyPressed() {
        if inputManager.isReadyToExecute {
            executeMathInputController()
            populateFromResult()
        }
        if inputManager.isCompleted {
            populateFromResult()
        }
        inputManager.multiplyPressed()
    }
    
    mutating func dividePressed() {
        if inputManager.isReadyToExecute {
            executeMathInputController()
            populateFromResult()
        }
        if inputManager.isCompleted {
            populateFromResult()
        }
        inputManager.dividePressed()
    }
    
    mutating func equalsPressed() {
        if inputManager.isCompleted {
            inputManager = MathInputManager(byPopulatingCalculationFrom: inputManager)
        }
        guard inputManager.isReadyToExecute else { return }
        executeMathInputController()
    }
    
    private mutating func executeMathInputController() {
        inputManager.execute()
        historyLog.append(inputManager.mathematicalEquation)
        printEquationToConsole()
    }
    
    // MARK: - Number Input
    
    mutating func decimalPressed() {
        inputManager.decimalPressed()
    }
    
    mutating func numberPressed(_ number: Int) {
        if inputManager.isCompleted {
            inputManager = MathInputManager()
        }
        inputManager.numberPressed(number)
    }
    
    //MARK: - Populate new math input controller
    
    private mutating func populateFromResult() {
        inputManager = MathInputManager(byPopulatingResultFrom: inputManager)
    }
    
    
    //MARK: - Console
    
    private func printEquationToConsole() {
        print("Equation: " + inputManager.generatePrintout())
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
    
    mutating func pasteInMathEquation(from mathEquation: MathematicalEquation) {
        guard let result = mathEquation.result else { return }
        inputManager = MathInputManager()
        pasteInNumber(from: result)
    }
}
