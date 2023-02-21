//
//  CalculatorEngineClearTests.swift
//  CalcumateTests
//
//  Created by Beavean on 25.08.2022.
//

@testable import Calcumate
import XCTest

final class CalculatorEngineClearTests: XCTestCase {
    func testClear() {
        for leftSidePinPadNumber in 0 ... 9 {
            for rightSidePinPadNumber in 0 ... 9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSidePinPadNumber)
                calculatorEngine.addPressed()
                calculatorEngine.pinPadPressed(rightSidePinPadNumber)
                calculatorEngine.equalsPressed()
                calculatorEngine.clearPressed()
                XCTAssertTrue(calculatorEngine.displayText == "0")
                calculatorEngine.pinPadPressed(leftSidePinPadNumber)
                calculatorEngine.subtractPressed()
                calculatorEngine.pinPadPressed(rightSidePinPadNumber)
                calculatorEngine.equalsPressed()
                calculatorEngine.clearPressed()
                XCTAssertTrue(calculatorEngine.displayText == "0")
                calculatorEngine.pinPadPressed(leftSidePinPadNumber)
                calculatorEngine.multiplyPressed()
                calculatorEngine.pinPadPressed(rightSidePinPadNumber)
                calculatorEngine.equalsPressed()
                calculatorEngine.clearPressed()
                XCTAssertTrue(calculatorEngine.displayText == "0")
                calculatorEngine.pinPadPressed(leftSidePinPadNumber)
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rightSidePinPadNumber)
                calculatorEngine.equalsPressed()
                calculatorEngine.clearPressed()
                XCTAssertTrue(calculatorEngine.displayText == "0")
            }
        }
    }
}
