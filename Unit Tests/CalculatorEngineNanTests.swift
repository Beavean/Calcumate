//
//  CalculatorEngineNanTests.swift
//  CalcumateTests
//
//  Created by Beavean on 25.08.2022.
//

@testable import Calcumate
import XCTest

final class CalculatorEngineNanTests: XCTestCase {
    func testNan() {
        for leftSidePinPadNumber in 0 ... 9 {
            var calculatorEngine = CalculatorEngine()
            calculatorEngine.pinPadPressed(leftSidePinPadNumber)
            calculatorEngine.dividePressed()
            calculatorEngine.pinPadPressed(0)
            calculatorEngine.equalsPressed()
            XCTAssertTrue(calculatorEngine.displayText == "Error")
        }
    }
}
