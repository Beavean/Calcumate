//
//  MathematicalEquationTests.swift
//  CalcumateTests
//
//  Created by Beavean on 18.08.2022.
//

@testable import Calcumate
import XCTest

final class MathematicalEquationTests: XCTestCase {
    func testAddition() {
        var mathEquation = MathematicalEquation(leftSide: .zero)
        mathEquation.leftSide = 4
        mathEquation.operation = .add
        mathEquation.rightSide = 4
        mathEquation.execute()
        let expectedResult = Decimal(8)
        XCTAssertTrue(mathEquation.result?.isEqual(to: expectedResult) ?? false)
    }

    func testSubtraction() {
        var mathEquation = MathematicalEquation(leftSide: .zero)
        mathEquation.leftSide = 4
        mathEquation.operation = .subtract
        mathEquation.rightSide = 4
        mathEquation.execute()
        let expectedResult = Decimal.zero
        XCTAssertTrue(mathEquation.result?.isEqual(to: expectedResult) ?? false)
    }

    func testMultiplication() {
        var mathEquation = MathematicalEquation(leftSide: .zero)
        mathEquation.leftSide = 4
        mathEquation.operation = .multiply
        mathEquation.rightSide = 4
        mathEquation.execute()
        let expectedResult = Decimal(16)
        XCTAssertTrue(mathEquation.result?.isEqual(to: expectedResult) ?? false)
    }

    func testDivision() {
        var mathEquation = MathematicalEquation(leftSide: .zero)
        mathEquation.leftSide = 4
        mathEquation.operation = .divide
        mathEquation.rightSide = 4
        mathEquation.execute()
        let expectedResult = Decimal(1)
        XCTAssertTrue(mathEquation.result?.isEqual(to: expectedResult) ?? false)
    }
}
