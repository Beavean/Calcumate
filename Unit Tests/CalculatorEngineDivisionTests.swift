//
//  CalculatorEngineDivisionTests.swift
//  CalcumateTests
//
//  Created by Beavean on 25.08.2022.
//


import XCTest
@testable import Calcumate

class CalculatorEngineDivisionTests: XCTestCase {
    
    // MARK: - Equals Button
    
    func testPinPadNumberAndEquals() throws {
        for leftSideNumber in 0...9 {
            for rightSideNumber in 1...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                XCTAssertTrue(calculatorEngine.displayText == (Decimal(leftSideNumber) / Decimal(rightSideNumber)).formatted())
            }
        }
    }
    
    func testContinuousPinPadNumberAndEquals() throws {
        var calculatorEngine = CalculatorEngine()
        for leftSideNumber in 0...9 {
            for rightSideNumber in 1...9 {
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                XCTAssertTrue(calculatorEngine.displayText == (Decimal(leftSideNumber) / Decimal(rightSideNumber)).formatted())
            }
        }
    }
    
    // MARK: - Operation Buttons
    
    func testPinPadNumberAndOperation() throws {
        for leftSideNumber in 0...9 {
            for rightSideNumber in 1...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.dividePressed()
                XCTAssertTrue(calculatorEngine.displayText == (Decimal(leftSideNumber) / Decimal(rightSideNumber)).formatted())
            }
        }
    }
    
    func testContinuousPinPadNumberAndOperation() throws {
        for leftSideNumber in 0...9 {
            var calculatorEngine = CalculatorEngine()
            calculatorEngine.pinPadPressed(leftSideNumber)
            calculatorEngine.dividePressed()
            var result: Decimal = Decimal(leftSideNumber)
            for rightSideNumber in 1...9 {
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.dividePressed()
                result = result / Decimal(rightSideNumber)
                XCTAssertTrue(calculatorEngine.displayText == result.formatted())
            }
        }
    }
}
