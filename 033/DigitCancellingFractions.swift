#!/usr/bin/env swift

// Provides the factorization of the passed in number as a set.
func factors(_ i: Int) -> Set<Int> {
    var factors: Set<Int> = []
    for f in 2...i {
        if i % f == 0 {
            factors.insert(f);
        }
    }
    return factors;
}

func isCurious(numerator: Int, denominator: Int) -> Bool {
    if numerator/denominator >= 1 {
        return false;
    }

    let frac = Double(numerator)/Double(denominator);

    // Digits pulled out of the fraction. Removal follows the 49/98 pattern.
    let numA = Double(numerator/10);
    let numB = Double(numerator%10);
    let denA = Double(denominator/10);
    let denB = Double(denominator%10);

    // If the removed digits are not matching, nothing curious.
    if numB != denA {
        return false;
    }

    // If it does not reduce the same, nothing curious.
    let curious = numA / denB;
    if frac != curious {
        return false;
    }

    return true;
}

// Solver script...

var bigNum = 1;
var bigDen = 1;

for num in 10...99 {
    for den in 10...99 {
        if isCurious(numerator: num, denominator: den) {
            print("how curious... \(num)/\(den)");
            bigNum *= num;
            bigDen *= den;
        }
    }
}

let bigNumFactors = factors(bigNum);
let bigDenFactors = factors(bigDen);

let commonFactors = bigNumFactors.intersection(bigDenFactors);

print("common factors... \(bigNum)/\(bigDen) -> \(commonFactors)")

for factor in commonFactors {
    while bigNum%factor == 0 && bigDen%factor == 0 {
        bigNum /= factor;
        bigDen /= factor;
    }
}

print("in conclusion... \(bigNum)/\(bigDen)")
