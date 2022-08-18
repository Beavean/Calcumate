//
//  MathematicalEquation.swift
//  Calcumate
//
//  Created by Beavean on 18.08.2022.
//

import Foundation

struct MathematicalEquation {
    
    enum OperationType {
        case add
        case subtract
        case multiply
        case divide
    }
    
    var leftSide: Decimal
    var rightSide: Decimal?
    var operation: OperationType?
    var result: Decimal?
    
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
    
}
