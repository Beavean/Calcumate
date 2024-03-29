//
//  CalculatorEnginePinPadTests.swift
//  CalcumateTests
//
//  Created by Beavean on 25.08.2022.
//

@testable import Calcumate
import XCTest

final class CalculatorEngineDecimalTests: XCTestCase {
    func testLeftSideDecimalPinPadNumbers() {
        for leftSidePinPadNumber in 0 ... 9 {
            for rightSidePinPadNumber in 0 ... 9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSidePinPadNumber)
                calculatorEngine.decimalPressed()
                calculatorEngine.pinPadPressed(leftSidePinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rightSidePinPadNumber)
                calculatorEngine.equalsPressed()
                let leftSide = Decimal(leftSidePinPadNumber) + (Decimal(leftSidePinPadNumber) / 10)
                let rightSide = Decimal(rightSidePinPadNumber)
                let expectedResult = leftSide + rightSide
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }

    func testRightSideDecimalPinPadNumbers() {
        for leftSidePinPadNumber in 0 ... 9 {
            for rightSidePinPadNumber in 0 ... 9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSidePinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rightSidePinPadNumber)
                calculatorEngine.decimalPressed()
                calculatorEngine.pinPadPressed(rightSidePinPadNumber)
                calculatorEngine.equalsPressed()
                let leftSide = Decimal(leftSidePinPadNumber)
                let rightSide = Decimal(rightSidePinPadNumber) + (Decimal(rightSidePinPadNumber) / 10)
                let expectedResult = leftSide + rightSide
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }

    func testLeftSideAndRightSideDecimalPinPadNumbers() {
        for leftSidePinPadNumber in 0 ... 9 {
            for rightSidePinPadNumber in 0 ... 9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSidePinPadNumber)
                calculatorEngine.decimalPressed()
                calculatorEngine.pinPadPressed(leftSidePinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rightSidePinPadNumber)
                calculatorEngine.decimalPressed()
                calculatorEngine.pinPadPressed(rightSidePinPadNumber)
                calculatorEngine.equalsPressed()
                let leftSide = Decimal(leftSidePinPadNumber) + (Decimal(leftSidePinPadNumber) / 10)
                let rightSide = Decimal(rightSidePinPadNumber) + (Decimal(rightSidePinPadNumber) / 10)
                let expectedResult = leftSide + rightSide
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
            }
        }
    }
}
