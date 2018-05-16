//
//  Rational.swift
//  LR51
//
//  Created by Marty on 12/05/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

struct Rational {
    public private(set) var numerator   = 0
    public private(set) var denominator = 0
    
    init() {
    }
    
    init(withNumerator numerator: Int, andDenominator denominator: Int) {
        self.numerator   = numerator
        self.denominator = denominator
    }
    
    var value: Double {
        return Double(numerator) / Double(denominator)
    }
    
    
    private mutating func reduce() {
        func greatestCommonDivisor() -> Int {
            var a = self.numerator
            var b = self.denominator
            
            while b != 0 {
                (a, b) = (b, a % b)
            }
            
            return a != 0 ? abs(a) : 1
        }
        
        let divisor = greatestCommonDivisor()
        
        self.numerator   /= divisor
        self.denominator /= divisor
    }
    
    // minus in numerator
    private mutating func normalize() {
        if denominator < 0 {
            numerator   = -numerator
            denominator = -denominator
        }
    }
}


// MARK: - Expansion of arithmetic operations -
extension Rational {
    static prefix func + (value: Rational) -> Rational {
        var result = Rational(withNumerator: value.numerator, andDenominator: value.denominator)
        result.reduce()
        
        return result
    }
    
    static prefix func - (value: Rational) -> Rational {
        var result = Rational(withNumerator: -value.numerator, andDenominator: value.denominator)
        result.reduce()
        
        return result
    }
    
    static func + (left: Rational, right: Rational) -> Rational {
        let denominator = left.denominator * right.denominator
        let numerator   = left.numerator * right.denominator + right.numerator * left.denominator
        
        var result = Rational(withNumerator: numerator, andDenominator: denominator)
        result.reduce()
        
        return result
    }
    
    static func - (left: Rational, right: Rational) -> Rational {
        let denominator = left.denominator * right.denominator
        let numerator   = left.numerator * right.denominator - right.numerator * left.denominator
        
        var result = Rational(withNumerator: numerator, andDenominator: denominator)
        result.reduce()
        
        return result
    }
    
    static func += (left: inout Rational, right: Rational) {
        left = left + right
        left.reduce()
    }
    
    static func -= (left: inout Rational, right: Rational) {
        left = left - right
        left.reduce()
    }
    
    static func * (left: Rational, right: Rational) -> Rational {
        let numerator = left.numerator * right.numerator
        let denominator = left.denominator * right.denominator
        
        var result = Rational(withNumerator: numerator, andDenominator: denominator)
        result.reduce()
        
        return result
    }
    
    static func / (left: Rational, right: Rational) -> Rational {
        let numerator = left.numerator * right.denominator
        let denominator = left.denominator * right.numerator
        
        var result = Rational(withNumerator: numerator, andDenominator: denominator)
        result.reduce()
        
        return result
    }
    
    static func *= (left: inout Rational, right: Rational) {
        left = left * right
        left.reduce()
    }
    
    static func /= (left: inout Rational, right: Rational) {
        left = left / right
        left.reduce()
    }
    
    static func == (left: Rational, right: Rational) -> Bool {
        var leftNormalized  = left
        var rightNormalized = right
        
        leftNormalized.reduce()
        leftNormalized.normalize()
        
        rightNormalized.reduce()
        rightNormalized.normalize()
        
        return leftNormalized.numerator == rightNormalized.numerator && leftNormalized.denominator == rightNormalized.denominator
    }
    
    static func != (left: Rational, right: Rational) -> Bool {
        return !(left == right)
    }
    
    static func > (left: Rational, right: Rational) -> Bool {
        var minus = left - right
        minus.reduce()
        minus.normalize()
        
        return minus.numerator > 0
    }
    
    static func < (left: Rational, right: Rational) -> Bool {
        var minus = left - right
        minus.reduce()
        minus.normalize()
        
        return minus.numerator < 0
    }
    
    static func >= (left: Rational, right: Rational) -> Bool {
        return !(left < right)
    }
    
    static func <= (left: Rational, right: Rational) -> Bool {
        return !(left > right)
    }
    
    
    static prefix func << (value: Rational) {
        var result = value
        result.reduce()
        result.normalize()
        
        print("\(result.numerator) / \(result.denominator)")
    }
    
    static prefix func >> (value: inout Rational) {
        let divSign = "/"
        
        if let lines = readLine()?.components(separatedBy: " "),
        lines.count == 3,
        let left = Int(lines[0]),
        let right = Int(lines[2]),
        lines[1] == divSign {
            value.numerator = left
            value.denominator = right
        } else {
            value = Rational()
        }
    }
}

prefix operator <<
prefix operator >>
