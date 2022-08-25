//
//  CalculatorEnginePercentageTests.swift
//  CalcumateTests
//
//  Created by Beavean on 25.08.2022.
//

import XCTest
@testable import Calcumate

class CalculatorEnginePercentageTests: XCTestCase {

    // MARK: - Addition
    
    func testLHSPercentageWithAddition() throws {
        for leftSideNumber in 0...9 {
            for rightSideNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.percentagePressed()
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                let expectedResult = Decimal(leftSideNumber) / Decimal(100) + Decimal(rightSideNumber)
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }
    
    func testRHSPercentageWithAddition() throws {
        for leftSideNumber in 0...9 {
            for rightSideNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.percentagePressed()
                calculatorEngine.equalsPressed()
                let expectedResult = Decimal(leftSideNumber) + Decimal(rightSideNumber) / Decimal(100)
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }

    // MARK: - Subtraction
    
    func testLHSPercentageWithSubtraction() throws {
        for leftSideNumber in 0...9 {
            for rightSideNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.percentagePressed()
                calculatorEngine.subtractPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                let expectedResult = Decimal(leftSideNumber) / Decimal(100) - Decimal(rightSideNumber)
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }
    
    func testRHSPercentageWithSubtraction() throws {
        for leftSideNumber in 0...9 {
            for rightSideNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.subtractPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.percentagePressed()
                calculatorEngine.equalsPressed()
                let expectedResult = Decimal(leftSideNumber) - Decimal(rightSideNumber) / Decimal(100)
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }
    
    // MARK: - Multiplication
    
    func testLHSPercentageWithMultiplication() throws {
        for leftSideNumber in 0...9 {
            for rightSideNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.percentagePressed()
                calculatorEngine.multiplyPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                let expectedResult = Decimal(leftSideNumber) / Decimal(100) * Decimal(rightSideNumber)
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }
    
    func testRHSPercentageWithMultiplication() throws {
        for leftSideNumber in 0...9 {
            for rightSideNumber in 0...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.multiplyPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.percentagePressed()
                calculatorEngine.equalsPressed()
                let expectedResult = Decimal(leftSideNumber) * Decimal(rightSideNumber) / Decimal(100)
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }
    
    // MARK: - Division
    
    func testLHSPercentageWithDivision() throws {
        for leftSideNumber in 0...9 {
            for rightSideNumber in 1...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.percentagePressed()
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                let expectedResult = (Decimal(leftSideNumber) / Decimal(100)) / Decimal(rightSideNumber)
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }
    
    func testRHSPercentageWithDivision() throws {
        for leftSideNumber in 0...9 {
            for rightSideNumber in 1...9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.percentagePressed()
                calculatorEngine.equalsPressed()
                let expectedResult = Decimal(leftSideNumber) / (Decimal(rightSideNumber) / Decimal(100))
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }
}
