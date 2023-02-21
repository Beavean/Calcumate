//
//  CalculatorEnginePinPadTests.swift
//  CalcumateTests
//
//  Created by Beavean on 25.08.2022.
//

@testable import Calcumate
import XCTest

final class CalculatorEnginePinPadTests: XCTestCase {
    // MARK: - Large Numbers

    func testLargePinPadNumbersWithAddition() {
        for leftSideNumber in 0 ... 9 {
            for rightSideNumber in 0 ... 9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                let leftSide = leftSideNumber * 1000 + leftSideNumber * 100 + leftSideNumber * 10 + leftSideNumber
                let rightSide = rightSideNumber * 1000 + rightSideNumber * 100 + rightSideNumber * 10 + rightSideNumber
                let expectedResult = leftSide + rightSide
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }

    func testLargePinPadNumbersWithSubtraction() {
        for leftSideNumber in 0 ... 9 {
            for rightSideNumber in 0 ... 9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.subtractPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                let leftSide = leftSideNumber * 1000 + leftSideNumber * 100 + leftSideNumber * 10 + leftSideNumber
                let rightSide = rightSideNumber * 1000 + rightSideNumber * 100 + rightSideNumber * 10 + rightSideNumber
                let expectedResult = leftSide - rightSide
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }

    func testLargePinPadNumbersWithMultiplication() {
        for leftSideNumber in 0 ... 9 {
            for rightSideNumber in 0 ... 9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.multiplyPressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                let leftSide = leftSideNumber * 1000 + leftSideNumber * 100 + leftSideNumber * 10 + leftSideNumber
                let rightSide = rightSideNumber * 1000 + rightSideNumber * 100 + rightSideNumber * 10 + rightSideNumber
                let expectedResult = leftSide * rightSide
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }

    func testLargePinPadNumbersWithDivision() {
        for leftSideNumber in 0 ... 9 {
            for rightSideNumber in 1 ... 9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                let leftSide = leftSideNumber * 1000 + leftSideNumber * 100 + leftSideNumber * 10 + leftSideNumber
                let rightSide = rightSideNumber * 1000 + rightSideNumber * 100 + rightSideNumber * 10 + rightSideNumber
                let expectedResult = Decimal(leftSide) / Decimal(rightSide)
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }
}
