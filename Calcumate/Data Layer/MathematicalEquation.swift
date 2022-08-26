//
//  MathematicalEquation.swift
//  Calcumate
//
//  Created by Beavean on 18.08.2022.
//

import Foundation

struct MathematicalEquation: Codable {
    
    enum OperationType: Codable {
        case add
        case subtract
        case multiply
        case divide
    }
    
    var leftSide: Decimal
    var rightSide: Decimal?
    var operation: OperationType?
    var result: Decimal?
    
    //MARK: - Execution
    
    var executed: Bool {
        return result != nil
    }
    
    mutating func execute() {
        guard let rightSide = self.rightSide, let operation = self.operation else {
            return
        }
        switch operation {
        case .add:
            result = leftSide + rightSide
        case .subtract:
            result = leftSide - rightSide
        case .multiply:
            result = leftSide * rightSide
        case .divide:
            result = leftSide / rightSide
        }
    }
    
    //MARK: - Negate
    
    mutating func negateLeftSide() {
        leftSide.negate()
    }
    
    mutating func negateRightSide() {
        rightSide?.negate()
    }
    
    //MARK: - Percentage
    
    mutating func percentageLeftSide() {
        leftSide = calculatePercentageValue(leftSide)
    }
    
    mutating func percentageRightSide() {
        guard let decimal = rightSide else { return }
        rightSide = calculatePercentageValue(decimal)
    }
    
    private func calculatePercentageValue(_ decimal: Decimal) -> Decimal {
        return decimal / 100
    }
    
    //MARK: - String representation
    
    func generatePrintout() -> String{
        let operationString = generateStringFromOperation()
        return leftSide.formatted() + " " + operationString + " " + (rightSide?.formatted() ?? "") + " = " + (result?.formatted() ?? "")
    }
    
    func generateStringFromOperation() -> String {
        switch operation {
        case .add: return "+"
        case .subtract: return "-"
        case .multiply: return "*"
        case .divide: return "/"
        case .none: return ""
        }
    }
}
