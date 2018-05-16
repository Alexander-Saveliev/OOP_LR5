//
//  test_LR51.swift
//  test_LR51
//
//  Created by Marty on 12/05/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import XCTest

class test_LR51: XCTestCase {
    
    // MARK: - Multiplication -
    func testMultiplicationWithoutReducing() {
        let left  = Rational(withNumerator: 1, andDenominator: 2)
        let right = Rational(withNumerator: 1, andDenominator: 3)
        let mult = left * right
        
        XCTAssertEqual(mult.numerator, 1)
        XCTAssertEqual(mult.denominator, 6)
    }
    
    func testMultiplicationWithReducing() {
        let left  = Rational(withNumerator: 3, andDenominator: 4)
        let right = Rational(withNumerator: 4, andDenominator: 3)
        let mult = left * right
        
        XCTAssertEqual(mult.numerator, 1)
        XCTAssertEqual(mult.denominator, 1)
    }
    
    func testMinusMultiplicationWithoutReducing() {
        let left  = Rational(withNumerator: -1, andDenominator: 2)
        let right = Rational(withNumerator: 1, andDenominator: 3)
        let mult = left * right
        
        XCTAssertEqual(mult.numerator, -1)
        XCTAssertEqual(mult.denominator, 6)
    }
    
    func testMinusMultiplicationWithReducing() {
        let left  = Rational(withNumerator: -3, andDenominator: 2)
        let right = Rational(withNumerator: 1, andDenominator: 3)
        let mult = left * right
        
        XCTAssertEqual(mult.numerator, -1)
        XCTAssertEqual(mult.denominator, 2)
    }
    
    func testZeroMultiplication() {
        let left  = Rational(withNumerator: 1, andDenominator: 0)
        let right = Rational(withNumerator: 1, andDenominator: 3)
        let mult = left * right
        
        XCTAssertEqual(mult.numerator, 1)
        XCTAssertEqual(mult.denominator, 0)
    }
    
    
    // MARK: - Division -
    func testDivisionWithoutReducing() {
        let left  = Rational(withNumerator: 1, andDenominator: 2)
        let right = Rational(withNumerator: 1, andDenominator: 3)
        let mult = left / right
        
        XCTAssertEqual(mult.numerator, 3)
        XCTAssertEqual(mult.denominator, 2)
    }
    
    func testDivisionWithReducing() {
        let left  = Rational(withNumerator: 1, andDenominator: 2)
        let right = Rational(withNumerator: 1, andDenominator: 4)
        let mult = left / right
        
        XCTAssertEqual(mult.numerator, 2)
        XCTAssertEqual(mult.denominator, 1)
    }

    func testMinusDivisionWithReducing() {
        let left  = Rational(withNumerator: -1, andDenominator: 2)
        let right = Rational(withNumerator: 1, andDenominator: 4)
        let mult = left / right
        
        XCTAssertEqual(mult.numerator, -2)
        XCTAssertEqual(mult.denominator, 1)
    }
    
    func testMinusDivisionWithoutReducing() {
        let left  = Rational(withNumerator: 1, andDenominator: 2)
        let right = Rational(withNumerator: -1, andDenominator: 3)
        let mult = left / right
        
        XCTAssertEqual(mult.numerator, 3)
        XCTAssertEqual(mult.denominator, -2)
    }
    
    func testZeroNumeratorDivision() {
        let left  = Rational(withNumerator: 0, andDenominator: 2)
        let right = Rational(withNumerator: -1, andDenominator: 3)
        let mult = left / right
        
        XCTAssertEqual(mult.numerator, 0)
        XCTAssertEqual(mult.denominator, -1)
    }
    
    func testZeroDenominatorDivision() {
        let left  = Rational(withNumerator: 1, andDenominator: 2)
        let right = Rational(withNumerator: 0, andDenominator: 3)
        let mult = left / right
        
        XCTAssertEqual(mult.numerator, 1)
        XCTAssertEqual(mult.denominator, 0)
    }
    
    
    // MARK: - Unar plus -
    func testUnarPlus() {
        let value  = Rational(withNumerator: 1, andDenominator: 2)
        let plusValue = +value

        XCTAssertEqual(plusValue.numerator, 1)
        XCTAssertEqual(plusValue.denominator, 2)
    }
    
    func testUnarPlusZero() {
        let value  = Rational(withNumerator: 0, andDenominator: 2)
        let plusValue = +value
        
        XCTAssertEqual(plusValue.numerator, 0)
        XCTAssertEqual(plusValue.denominator, 1)
    }
    func testUnarZeroWithoutReduce() {
        let value  = Rational(withNumerator: 3, andDenominator: 5)
        let plusValue = +value
        
        XCTAssertEqual(plusValue.numerator, 3)
        XCTAssertEqual(plusValue.denominator, 5)
    }
    
    // MARK: - Unar minus -
    func testUnarMinus() {
        let value  = Rational(withNumerator: 1, andDenominator: 2)
        let plusValue = -value
        
        XCTAssertEqual(plusValue.numerator, -1)
        XCTAssertEqual(plusValue.denominator, 2)
    }
    
    func testUnarMinusZero() {
        let value  = Rational(withNumerator: 0, andDenominator: 2)
        let plusValue = -value
        
        XCTAssertEqual(plusValue.numerator, 0)
        XCTAssertEqual(plusValue.denominator, 1)
    }
    func testUnarMinusWithoutReduce() {
        let value  = Rational(withNumerator: 3, andDenominator: 5)
        let plusValue = -value
        
        XCTAssertEqual(plusValue.numerator, -3)
        XCTAssertEqual(plusValue.denominator, 5)
    }
    
    // MARK: - Binary plus -
    func testBinaryPlus() {
        let left  = Rational(withNumerator: 1, andDenominator: 2)
        let right = Rational(withNumerator: 1, andDenominator: 3)
        let plus = left + right
        
        XCTAssertEqual(plus.numerator, 5)
        XCTAssertEqual(plus.denominator, 6)
    }
    
    func testBinaryPlusWithReduce() {
        let left  = Rational(withNumerator: 1, andDenominator: 4)
        let right = Rational(withNumerator: -3, andDenominator: 4)
        let plus = left + right
        
        XCTAssertEqual(plus.numerator, -1)
        XCTAssertEqual(plus.denominator, 2)
    }
    
    func testBinaryPlusWithReduceMinus() {
        let left  = Rational(withNumerator: -1, andDenominator: 2)
        let right = Rational(withNumerator: 2, andDenominator: 4)
        let plus = left + right
        
        XCTAssertEqual(plus.numerator, 0)
        XCTAssertEqual(plus.denominator, 1)
    }
    
    func testBinaryPlusWithZeor() {
        let left  = Rational(withNumerator: 1, andDenominator: 2)
        let right = Rational(withNumerator: 0, andDenominator: 3)
        let plus = left + right
        
        XCTAssertEqual(plus.numerator, 1)
        XCTAssertEqual(plus.denominator, 2)
    }
    
    // MARK: - Binary minus -
    func testBinaryMinus() {
        let left  = Rational(withNumerator: 1, andDenominator: 2)
        let right = Rational(withNumerator: 1, andDenominator: 3)
        let minus = left - right
        
        XCTAssertEqual(minus.numerator, 1)
        XCTAssertEqual(minus.denominator, 6)
    }

    func testBinaryMinusWithReduce() {
        let left  = Rational(withNumerator: 1, andDenominator: 4)
        let right = Rational(withNumerator: 3, andDenominator: 4)
        let minus = left - right

        XCTAssertEqual(minus.numerator, -1)
        XCTAssertEqual(minus.denominator, 2)
    }

    func testBinaryMinusWithReduceMinus() {
        let left  = Rational(withNumerator: -1, andDenominator: 2)
        let right = Rational(withNumerator: 2, andDenominator: 4)
        let minus = left - right

        XCTAssertEqual(minus.numerator, -1)
        XCTAssertEqual(minus.denominator, 1)
    }

    func testBinaryMinusWithZeor() {
        let left  = Rational(withNumerator: 1, andDenominator: 2)
        let right = Rational(withNumerator: 0, andDenominator: 3)
        let minus = left - right

        XCTAssertEqual(minus.numerator, 1)
        XCTAssertEqual(minus.denominator, 2)
    }
    
    // MARK: - Increment -
    func testIncrement() {
        var value = Rational(withNumerator: 1, andDenominator: 2)
        let plus = Rational(withNumerator: 1, andDenominator: 3)
        value += plus

        XCTAssertEqual(value.numerator, 5)
        XCTAssertEqual(value.denominator, 6)
    }
    
    // MARK: - Decrement -
    func testDecrement() {
        var value = Rational(withNumerator: 1, andDenominator: 2)
        let minus = Rational(withNumerator: 1, andDenominator: 3)
        value -= minus
        
        XCTAssertEqual(value.numerator, 1)
        XCTAssertEqual(value.denominator, 6)
    }
    
    // MARK: - *= -
    func testMultEqual() {
        var value = Rational(withNumerator: 1, andDenominator: 2)
        let mult = Rational(withNumerator: 1, andDenominator: 3)
        value *= mult
        
        XCTAssertEqual(value.numerator, 1)
        XCTAssertEqual(value.denominator, 6)
    }
    
    // MARK: - /= -
    func testDivEqual() {
        var value = Rational(withNumerator: 1, andDenominator: 2)
        let div = Rational(withNumerator: 1, andDenominator: 3)
        value /= div
        
        XCTAssertEqual(value.numerator, 3)
        XCTAssertEqual(value.denominator, 2)
    }
    
    // MARK: - Equal -
    func testEqual() {
        var left  = Rational(withNumerator: 1, andDenominator: 2)
        var right = Rational(withNumerator: 1, andDenominator: 3)
        
        XCTAssertFalse(left == right)
        
        left  = Rational(withNumerator: 2, andDenominator: 3)
        right = Rational(withNumerator: 1, andDenominator: 3)
        
        XCTAssertFalse(left == right)
        
        left  = Rational(withNumerator: -1, andDenominator: 3)
        right = Rational(withNumerator: 1, andDenominator: 3)
        
        XCTAssertFalse(left == right)
        
        left  = Rational(withNumerator: 1, andDenominator: -3)
        right = Rational(withNumerator: 1, andDenominator: 3)
        
        XCTAssertFalse(left == right)
        
        left  = Rational(withNumerator: 1, andDenominator: -3)
        right = Rational(withNumerator: -1, andDenominator: 3)
        
        XCTAssertTrue(left == right)
    }
    
    func testEqualWithReduce() {
        var left  = Rational(withNumerator: 2, andDenominator: 4)
        var right = Rational(withNumerator: 1, andDenominator: 2)
        
        XCTAssertTrue(left == right)
        
        left  = Rational(withNumerator: 10, andDenominator: -1000)
        right = Rational(withNumerator: -2, andDenominator: 200)
        
        XCTAssertTrue(left == right)
    }
    
    // MARK: - Not equal -
    func testNotEqual() {
        var left  = Rational(withNumerator: 1, andDenominator: 2)
        var right = Rational(withNumerator: 1, andDenominator: 3)
        
        XCTAssertTrue(left != right)
    }
    
    // MARK: - Comparison -
    func testGreater() {
        var left  = Rational(withNumerator: 1, andDenominator: 2)
        var right = Rational(withNumerator: 1, andDenominator: 3)
        
        XCTAssertTrue(left > right)
        
        left  = Rational(withNumerator: 3, andDenominator: 2)
        right = Rational(withNumerator: 2, andDenominator: 2)
        
        XCTAssertTrue(left > right)
        
        left  = Rational(withNumerator: 0, andDenominator: 2)
        right = Rational(withNumerator: -2, andDenominator: 2)
        
        XCTAssertTrue(left > right)
    }
    
    func testLess() {
        var left  = Rational(withNumerator: 1, andDenominator: 3)
        var right = Rational(withNumerator: 1, andDenominator: 2)
        
        XCTAssertTrue(left < right)
        
        left  = Rational(withNumerator: 2, andDenominator: 2)
        right = Rational(withNumerator: 3, andDenominator: 2)
        
        XCTAssertTrue(left < right)
        
        left  = Rational(withNumerator: -1, andDenominator: 2)
        right = Rational(withNumerator: 1, andDenominator: 2)
        
        XCTAssertTrue(left < right)
    }
    
    func testGreaterOrEqual() {
        var left  = Rational(withNumerator: 1, andDenominator: 2)
        var right = Rational(withNumerator: 1, andDenominator: 3)
        
        XCTAssertTrue(left >= right)
        
        left  = Rational(withNumerator: 2, andDenominator: 2)
        right = Rational(withNumerator: 3, andDenominator: 3)
        
        XCTAssertTrue(left >= right)
    }
    
    func testLessOrEqual() {
        var left  = Rational(withNumerator: 1, andDenominator: 3)
        var right = Rational(withNumerator: 1, andDenominator: 2)
        
        XCTAssertTrue(left <= right)
        
        left  = Rational(withNumerator: 2, andDenominator: 2)
        right = Rational(withNumerator: 3, andDenominator: 3)
        
        XCTAssertTrue(left >= right)
    }
    
    // MARK: - Other -
    func testOutValue() {
        var value = Rational(withNumerator: 1, andDenominator: 2)
        XCTAssertEqual(value.value, 0.5, accuracy: 0.005)
    }
    
    func testOutValueInf() {
        var value = Rational(withNumerator: 1, andDenominator: 0)
        XCTAssertEqual(value.value, Double.infinity)
    }
}
