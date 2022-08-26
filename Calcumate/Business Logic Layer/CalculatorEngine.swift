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
    
    private var dataStore = DataStoreManager(key: CalculatorEngine.Names.dataStore)
    
    //MARK: - Display
    
    var displayText: String {
        return inputManager.displayText
    }
    
    // MARK: - Extra Functions
    
    mutating func clearPressed() {
        inputManager = MathInputManager()
        deletePreviousSession()
    }
    
    mutating func negatePressed() {
        populateFromResultIfNeeded()
        inputManager.negatePressed()
    }
    
    mutating func percentagePressed() {
        populateFromResultIfNeeded()
        inputManager.percentagePressed()
    }
    
    // MARK: - Operations
    
    mutating func addPressed() {
        executeAndPopulateFromResult()
        inputManager.addPressed()
    }
    
    mutating func subtractPressed() {
        executeAndPopulateFromResult()
        inputManager.subtractPressed()
    }
    
    mutating func multiplyPressed() {
        executeAndPopulateFromResult()
        inputManager.multiplyPressed()
    }
    
    mutating func dividePressed() {
        executeAndPopulateFromResult()
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
        saveSession()
    }
    
    // MARK: - Number Input
    
    mutating func decimalPressed() {
        if inputManager.isCompleted {
            inputManager = MathInputManager()
        }
        inputManager.decimalPressed()
    }
    
    mutating func pinPadPressed(_ number: Int) {
        guard number >= 0, number <= 9 else { return }
        if inputManager.isCompleted {
            inputManager = MathInputManager()
        }
        inputManager.pinPadPressed(number)
    }
    
    //MARK: - Populate new math input controller
    
    private mutating func populateFromResult() {
        inputManager = MathInputManager(byPopulatingResultFrom: inputManager)
    }
    
    mutating private func populateFromResultIfNeeded() {
        if inputManager.isCompleted {
            populateFromResult()
        }
    }
    
    mutating private func executeAndPopulateFromResult() {
        if inputManager.isReadyToExecute {
            executeMathInputController()
            populateFromResult()
        }
        populateFromResultIfNeeded()
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
    
    //MARK: - Restoring Session
    
    private func deletePreviousSession() {
        dataStore.deleteValue()
    }
    
    private func saveSession() {
        guard isMathInputControllerSafeToBeSaved() else {
            deletePreviousSession()
            return
        }
        let mathEquation = inputManager.mathematicalEquation
        let encoder = JSONEncoder()
        if let encodedEquation = try? encoder.encode(mathEquation) {
            dataStore.set(encodedEquation)
        }
    }
    
    mutating func restoreFromLastSession() -> Bool {
        guard let encodedEquation = dataStore.getValue() as? Data else {
            return false
        }
        let decoder = JSONDecoder()
        if let previousEquation = try? decoder.decode(MathematicalEquation.self, from: encodedEquation) {
            inputManager = MathInputManager(byRestoringFrom: previousEquation)
        }
        return true
    }
    
    private func isMathInputControllerSafeToBeSaved() -> Bool {
        return !inputManager.containsNotNumbers
    }
    
}
