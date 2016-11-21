//
//  BigUInt+RandomKit.swift
//  RandomKitBigInt
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015-2016 Nikolai Vazquez
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import BigInt
import RandomKit

private extension BigUInt {

    static func _random(to count: Int, using randomGenerator: RandomGenerator) -> BigUInt {
        var result: BigUInt = 0
        for i in 0 ..< count {
            result[i] = .random(using: randomGenerator)
        }
        return result
    }

}

extension BigUInt: RandomToValue, RandomThroughValue {

    /// The random base from which to generate.
    public static let randomBase: BigUInt = 0

    /// Generates a random value of `Self` from `Self.randomBase` to `value` using `randomGenerator`.
    public static func random(to value: BigUInt, using randomGenerator: RandomGenerator) -> BigUInt {
        if value == randomBase {
            return value
        } else {
            return _random(to: value.count, using: randomGenerator) % value
        }
    }

    /// Generates a random value of `Self` from `Self.randomBase` through `value` using `randomGenerator`.
    public static func random(through value: BigUInt, using randomGenerator: RandomGenerator) -> BigUInt {
        if value == randomBase {
            return value
        } else {
            return _random(to: value.count, using: randomGenerator) % (value + 1)
        }
    }

}
