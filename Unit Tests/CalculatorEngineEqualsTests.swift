//
//  CalculatorEngineEqualsTests.swift
//  CalcumateTests
//
//  Created by Beavean on 25.08.2022.
//

@testable import Calcumate
import XCTest

final class CalculatorEngineEqualsTests: XCTestCase {
    func testEqualsWithAddition() {
        for leftSidePinPadNumber in 0 ... 9 {
            for rightSidePinPadNumber in 0 ... 9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSidePinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rightSidePinPadNumber)
                calculatorEngine.equalsPressed()
                var expectedResult = Decimal(leftSidePinPadNumber + rightSidePinPadNumber)
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
                for _ in 1 ... 10 {
                    calculatorEngine.equalsPressed()
                    expectedResult += Decimal(rightSidePinPadNumber)
                    XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
                }
            }
        }
    }

    func testEqualsWithSubtraction() {
        for leftSidePinPadNumber in 0 ... 9 {
            for rightSidePinPadNumber in 0 ... 9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSidePinPadNumber)
                calculatorEngine.subtractPressed()
                calculatorEngine.pinPadPressed(rightSidePinPadNumber)
                calculatorEngine.equalsPressed()
                var expectedResult = Decimal(leftSidePinPadNumber - rightSidePinPadNumber)
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
                for _ in 1 ... 10 {
                    calculatorEngine.equalsPressed()
                    expectedResult -= Decimal(rightSidePinPadNumber)
                    XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
                }
            }
        }
    }

    func testEqualsWithMultiplication() {
        for leftSidePinPadNumber in 0 ... 9 {
            for rightSidePinPadNumber in 0 ... 9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSidePinPadNumber)
                calculatorEngine.multiplyPressed()
                calculatorEngine.pinPadPressed(rightSidePinPadNumber)
                calculatorEngine.equalsPressed()
                var expectedResult = Decimal(leftSidePinPadNumber * rightSidePinPadNumber)
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
                for _ in 1 ... 10 {
                    calculatorEngine.equalsPressed()
                    expectedResult *= Decimal(rightSidePinPadNumber)
                    XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
                }
            }
        }
    }

    func testEqualsWithDivision() {
        for leftSidePinPadNumber in 1 ... 9 {
            for rightSidePinPadNumber in 1 ... 9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSidePinPadNumber)
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rightSidePinPadNumber)
                calculatorEngine.equalsPressed()
                var expectedResult = Decimal(leftSidePinPadNumber) / Decimal(rightSidePinPadNumber)
                XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
                for _ in 1 ... 10 {
                    calculatorEngine.equalsPressed()
                    expectedResult /= Decimal(rightSidePinPadNumber)
                    XCTAssertTrue(calculatorEngine.displayText == expectedResult.formatted())
                }
            }
        }
    }
}
