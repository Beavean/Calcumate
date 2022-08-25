//
//  CalculatorEngineMultiplicationTests.swift
//  CalcumateTests
//
//  Created by Beavean on 25.08.2022.
//

import XCTest
@testable import Calcumate

class CalculatorEngineMultiplicationTests: XCTestCase {
    
    // MARK: - Equals Button
    
    func testPinPadNumberAndEquals() throws {
        for leftSideNumber in 0...9 {
            for rightSideNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.multiplyPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                XCTAssertTrue(calculatorEngine.displayText == "\(leftSideNumber * rightSideNumber)")
            }
        }
    }
    
    func testContinuousPinPadNumberAndEquals() throws {
        var calculatorEngine = CalculatorEngine()
        for leftSideNumber in 0...9 {
            for rightSideNumber in 0...9 {
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.multiplyPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                XCTAssertTrue(calculatorEngine.displayText == "\(leftSideNumber * rightSideNumber)")
            }
        }
    }
    
    // MARK: - Operation Buttons
    
    func testPinPadNumberAndOperation() throws {
        for leftSideNumber in 0...9 {
            for rightSideNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.multiplyPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.multiplyPressed()
                XCTAssertTrue(calculatorEngine.displayText == "\(leftSideNumber * rightSideNumber)")
            }
        }
    }
    
    func testContinuousPinPadNumberAndOperation() throws {
        for leftSideNumber in 0...9 {
            var calculatorEngine = CalculatorEngine()
            calculatorEngine.pinPadPressed(leftSideNumber)
            calculatorEngine.multiplyPressed()
            var result = leftSideNumber
            for rightSideNumber in 0...9 {
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.multiplyPressed()
                result = result * rightSideNumber
                XCTAssertTrue(calculatorEngine.displayText == "\(result)")
            }
        }
    }
}
