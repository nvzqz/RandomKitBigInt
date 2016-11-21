//
//  BigInt+RandomKit.swift
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

import RandomKit
import BigInt

extension BigInt: RandomToValue, RandomThroughValue {

    /// The random base from which to generate.
    public static var randomBase: BigInt {
        return 0
    }

    /// Generates a random value of `Self` from `Self.randomBase` to `value` using `randomGenerator`.
    public static func random(to value: BigInt, using randomGenerator: RandomGenerator) -> BigInt {
        return BigInt(abs: .random(to: value.abs, using: randomGenerator), negative: value.negative)
    }

    /// Generates a random value of `Self` from `Self.randomBase` through `value` using `randomGenerator`.
    public static func random(through value: BigInt, using randomGenerator: RandomGenerator) -> BigInt {
        return BigInt(abs: .random(through: value.abs, using: randomGenerator), negative: value.negative)
    }

}
