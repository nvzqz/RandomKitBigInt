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

@_exported import RandomKit
@_exported import BigInt

extension BigUInt: Random {

    private static func _randomDigits(ofCount count: Int, using randomGenerator: RandomGenerator) -> [Digit] {
        let result = [Digit](repeating: 0, count: count)
        let buffer = UnsafeMutablePointer(mutating: result)
        randomGenerator.randomize(buffer: buffer, size: MemoryLayout<Digit>.size * count)
        return result
    }

    /// Generates a random value of `Self` of count `1` using `randomGenerator`.
    public static func random(using randomGenerator: RandomGenerator) -> BigUInt {
        return random(ofCount: 1, using: randomGenerator)
    }

    /// Generates a random value of `Self` of `count` digits using the default random generator.
    public static func random(ofCount count: Int) -> BigUInt {
        return random(ofCount: count, using: .default)
    }

    /// Generates a random value of `Self` of `count` digits using `randomGenerator`.
    public static func random(ofCount count: Int, using randomGenerator: RandomGenerator) -> BigUInt {
        return BigUInt(_randomDigits(ofCount: count, using: randomGenerator))
    }

    /// Generates a random `BigUInt` with a maximum width using the default random generator.
    public static func random(withMaxWidth width: Int) -> BigUInt {
        return random(withMaxWidth: width, using: .default)
    }

    /// Generates a random `BigUInt` with a maximum width using `randomGenerator`.
    public static func random(withMaxWidth width: Int, using randomGenerator: RandomGenerator) -> BigUInt {
        guard width > 0 else {
            return BigUInt()
        }

        let digitCount = (width + (Digit._width &- 1)) / Digit._width
        var digits = _randomDigits(ofCount: digitCount, using: randomGenerator)

        let moddedWidth = width % Digit._width
        if moddedWidth != 0 {
            digits[digitCount - 1] &= ._filled(to: moddedWidth)
        }

        return BigUInt(digits)
    }

    /// Generates a random `BigUInt` with an exact width using the default random generator.
    public static func random(withExactWidth width: Int) -> BigUInt {
        return random(withExactWidth: width, using: .default)
    }

    /// Generates a random `BigUInt` with an exact width using `randomGenerator`.
    public static func random(withExactWidth width: Int, using randomGenerator: RandomGenerator) -> BigUInt {
        guard width > 0 else {
            return 0
        }
        var result = random(withMaxWidth: width, using: randomGenerator)
        result[(width - 1) / Digit._width] |= ._bit(setAt: width)
        return result
    }

}

extension BigUInt: RandomToValue, RandomThroughValue, RandomWithinRange, RandomWithinClosedRange {

    /// The random base from which to generate.
    public static let randomBase: BigUInt = 0

    /// Generates a random value of `Self` from `Self.randomBase` to `value` using `randomGenerator`.
    public static func random(to value: BigUInt, using randomGenerator: RandomGenerator) -> BigUInt {
        if value == randomBase {
            return value
        } else {
            let max = BigUInt([Digit](repeating: .max, count: value.count))
            let maxModded = max % value
            var result: BigUInt
            repeat {
                result = random(ofCount: value.count, using: randomGenerator)
            } while result < maxModded
            return result % value
        }
    }

    /// Generates a random value of `Self` from `Self.randomBase` through `value` using `randomGenerator`.
    public static func random(through value: BigUInt, using randomGenerator: RandomGenerator) -> BigUInt {
        return random(to: value + 1, using: randomGenerator)
    }

}

private extension BigUInt.Digit {

    static var _width: Int {
        return MemoryLayout<BigUInt.Digit>.size * 8
    }

    static func _bit(setAt n: Int) -> BigUInt.Digit {
        return 1 << BigUInt.Digit((n &- 1) % _width)
    }

    static func _filled(to width: Int) -> BigUInt.Digit {
        return max >> BigUInt.Digit(_width &- width)
    }

}
