//
//  CalculatorEngineDivisionTests.swift
//  CalcumateTests
//
//  Created by Beavean on 25.08.2022.
//

@testable import Calcumate
import XCTest

final class CalculatorEngineDivisionTests: XCTestCase {
    // MARK: - Equals Button

    func testPinPadNumberAndEquals() {
        for leftSideNumber in 0 ... 9 {
            for rightSideNumber in 1 ... 9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                let resultText = (Decimal(leftSideNumber) / Decimal(rightSideNumber)).formatted()
                let result = calculatorEngine.displayText == resultText
                XCTAssertTrue(result)
            }
        }
    }

    func testContinuousPinPadNumberAndEquals() {
        var calculatorEngine = CalculatorEngine()
        for leftSideNumber in 0 ... 9 {
            for rightSideNumber in 1 ... 9 {
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                let resultText = (Decimal(leftSideNumber) / Decimal(rightSideNumber)).formatted()
                let result = calculatorEngine.displayText == resultText
                XCTAssertTrue(result)
            }
        }
    }

    // MARK: - Operation Buttons

    func testPinPadNumberAndOperation() {
        for leftSideNumber in 0 ... 9 {
            for rightSideNumber in 1 ... 9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.dividePressed()
                let resultText = (Decimal(leftSideNumber) / Decimal(rightSideNumber)).formatted()
                let result = calculatorEngine.displayText == resultText
                XCTAssertTrue(result)
            }
        }
    }

    func testContinuousPinPadNumberAndOperation() {
        for leftSideNumber in 0 ... 9 {
            var calculatorEngine = CalculatorEngine()
            calculatorEngine.pinPadPressed(leftSideNumber)
            calculatorEngine.dividePressed()
            var result: Decimal = .init(leftSideNumber)
            for rightSideNumber in 1 ... 9 {
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.dividePressed()
                result /= Decimal(rightSideNumber)
                XCTAssertTrue(calculatorEngine.displayText == result.formatted())
            }
        }
    }
}
