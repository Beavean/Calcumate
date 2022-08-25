//
//  CalculatorEngineAdditionTests.swift
//  CalcumateTests
//
//  Created by Beavean on 25.08.2022.
//

import XCTest
@testable import Calcumate

class CalculatorEngineTests: XCTestCase {
    
    //MARK: - Equals button
    
    func testPinPadAndEquals() throws {
        for leftSidePinPadNumber in 0...9 {
            for rightSidePinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSidePinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rightSidePinPadNumber)
                calculatorEngine.equalsPressed()
                XCTAssertTrue(calculatorEngine.displayText == "\(leftSidePinPadNumber + rightSidePinPadNumber)")
            }
        }
    }
    
    func testContinuousPinPadAndEquals() throws {
        var calculatorEngine = CalculatorEngine()
        for leftSidePinPadNumber in 0...9 {
            for rightSidePinPadNumber in 0...9 {
                calculatorEngine.pinPadPressed(leftSidePinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rightSidePinPadNumber)
                calculatorEngine.equalsPressed()
                XCTAssertTrue(calculatorEngine.displayText == "\(leftSidePinPadNumber + rightSidePinPadNumber)")
            }
        }
    }
    
    //MARK: - Operation buttons
    
    func testPinPadAndOperation() throws {
        for leftSidePinPadNumber in 0...9 {
            for rightSidePinPadNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSidePinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rightSidePinPadNumber)
                calculatorEngine.addPressed()
                XCTAssertTrue(calculatorEngine.displayText == "\(leftSidePinPadNumber + rightSidePinPadNumber)")
            }
        }
    }
    func testContinuousPinPadAndOperation() throws {
        for leftSidePinPadNumber in 0...9 {
            var calculatorEngine = CalculatorEngine()
            calculatorEngine.pinPadPressed(leftSidePinPadNumber)
            calculatorEngine.addPressed()
            var result = leftSidePinPadNumber
            for rightSidePinPadNumber in 0...9 {
                calculatorEngine.pinPadPressed(rightSidePinPadNumber)
                calculatorEngine.addPressed()
                result = result + rightSidePinPadNumber
                XCTAssertTrue(calculatorEngine.displayText == "\(result)")
            }
        }
    }
}

