//
//  CalculatorEngineSubtractionTests.swift
//  CalcumateTests
//
//  Created by Beavean on 25.08.2022.
//

@testable import Calcumate
import XCTest

final class CalculatorEngineSubtractionTests: XCTestCase {
    // MARK: - Equals Button

    func testPinPadNumberAndEquals() {
        for leftSideNumber in 0 ... 9 {
            for rightSideNumber in 0 ... 9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.subtractPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                XCTAssertTrue(calculatorEngine.displayText == "\(leftSideNumber - rightSideNumber)")
            }
        }
    }

    func testContinuousPinPadNumberAndEquals() {
        var calculatorEngine = CalculatorEngine()
        for leftSideNumber in 0 ... 9 {
            for rightSideNumber in 0 ... 9 {
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.subtractPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                XCTAssertTrue(calculatorEngine.displayText == "\(leftSideNumber - rightSideNumber)")
            }
        }
    }

    // MARK: - Operation Buttons

    func testPinPadNumberAndOperation() {
        for leftSideNumber in 0 ... 9 {
            for rightSideNumber in 0 ... 9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.subtractPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.subtractPressed()
                XCTAssertTrue(calculatorEngine.displayText == "\(leftSideNumber - rightSideNumber)")
            }
        }
    }

    func testContinuousPinPadNumberAndOperation() {
        for leftSideNumber in 0 ... 9 {
            var calculatorEngine = CalculatorEngine()
            calculatorEngine.pinPadPressed(leftSideNumber)
            calculatorEngine.subtractPressed()
            var result = leftSideNumber
            for rightSideNumber in 0 ... 9 {
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.subtractPressed()
                result -= rightSideNumber
                XCTAssertTrue(calculatorEngine.displayText == "\(result)")
            }
        }
    }
}
