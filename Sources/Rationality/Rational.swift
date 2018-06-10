//
//  Rational.swift
//  Rationality
//
//  Created by Erik Strottmann on 6/9/18.
//  Copyright © 2018 Erik Strottmann. All rights reserved.
//

public struct Rational<IntegerBase: BinaryInteger>: Hashable {
    public private(set) var numerator: IntegerBase
    public private(set) var denominator: IntegerBase

    public init(_ numerator: IntegerBase, _ denominator: IntegerBase) {
        precondition(denominator != 0, "Unable to initialize a Rational with zero denominator.")

        let _gcd = gcd(numerator, denominator)
        let invertNumerator: IntegerBase = denominator < 0 ? -1 : 1

        self.numerator = invertNumerator * (numerator / _gcd)
        self.denominator = abs(denominator / _gcd)
    }
}
