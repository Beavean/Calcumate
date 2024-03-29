//
//  CalculatorEngineRoundingAccuracy.swift
//  CalcumateTests
//
//  Created by Beavean on 25.08.2022.
//

@testable import Calcumate
import XCTest

final class CalculatorEngineRoundingAccuracy: XCTestCase {
    func testRoundingAccuracy() {
        for leftSideNumber in 0 ... 9 {
            for rightSideNumber in 1 ... 9 {
                var calculatorEngine = CalculatorEngine()
                calculatorEngine.pinPadPressed(leftSideNumber)
                calculatorEngine.dividePressed()
                calculatorEngine.pinPadPressed(rightSideNumber)
                calculatorEngine.equalsPressed()
                let safelyCalculatedResult = Decimal(leftSideNumber) / Decimal(rightSideNumber)
                print("XCT Result: " + "\(safelyCalculatedResult)")
                print("XCT Formatted Result: " + safelyCalculatedResult.formatted())
                print("XCT CalculatorEngine Output: " + calculatorEngine.displayText + "\n")
                XCTAssertTrue(calculatorEngine.displayText == safelyCalculatedResult.formatted())
            }
        }
    }
}
