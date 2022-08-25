//
//  CalculatorEngineNegateTests.swift
//  CalcumateTests
//
//  Created by Beavean on 25.08.2022.
//

import XCTest
@testable import Calcumate

class CalculatorEngineNegateTests: XCTestCase {

    // MARK: - Addition
    
    func testLHSNegateWithAddition() throws {
        for leftSideNumber in 0...9 {
            for rightSideNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.negatePressed()
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                let expectedResult = Decimal(-leftSideNumber + rightSideNumber)
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }
    
    func testRHSNegateWithAddition() throws {
        for leftSideNumber in 0...9 {
            for rightSideNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.negatePressed()
                calculatorEngine.equalsPressed()
                let expectedResult = Decimal(leftSideNumber + -rightSideNumber)
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }

    // MARK: - Subtraction
    
    func testLHSNegateWithSubtraction() throws {
        for leftSideNumber in 0...9 {
            for rightSideNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.negatePressed()
                calculatorEngine.subtractPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                let expectedResult = Decimal(-leftSideNumber - rightSideNumber)
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }
    
    func testRHSNegateWithSubtraction() throws {
        for leftSideNumber in 0...9 {
            for rightSideNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.subtractPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.negatePressed()
                calculatorEngine.equalsPressed()
                let expectedResult = Decimal(leftSideNumber - -rightSideNumber)
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }
    
    // MARK: - Multiplication
    
    func testLHSNegateWithMultiplication() throws {
        
        for leftSideNumber in 0...9 {
            for rightSideNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.negatePressed()
                calculatorEngine.multiplyPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                let expectedResult = Decimal(-leftSideNumber * rightSideNumber)
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }
    
    func testRHSNegateWithMultiplication() throws {
        for leftSideNumber in 0...9 {
            for rightSideNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.multiplyPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.negatePressed()
                calculatorEngine.equalsPressed()
                let expectedResult = Decimal(leftSideNumber * -rightSideNumber)
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }
    
    // MARK: - Division
    
    func testLHSNegateWithDivision() throws {
        for leftSideNumber in 0...9 {
            for rightSideNumber in 1...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.negatePressed()
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                let expectedResult = Decimal(-leftSideNumber) / Decimal(rightSideNumber)
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }
    
    func testRHSNegateWithDivision() throws {
        for leftSideNumber in 0...9 {
            for rightSideNumber in 1...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.negatePressed()
                calculatorEngine.equalsPressed()
                let expectedResult = Decimal(leftSideNumber) / Decimal(-rightSideNumber)
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }
}

