// https://projecteuler.net/problem=43

import Algorithms
import Euler

let digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
// From problem definition.
let divisors = [
    2: 2,
    3: 3,
    4: 5,
    5: 7,
    6: 11,
    7: 13,
    8: 17,
];

func isProperlyDivisble(_ d: [Int]) -> Bool {
    for i in 2...8 {
        var x = 1;
        for j in 0...2 {
            x *= d[i - 1 + j]
        }

        // Check that the divisor matches, per the problem.
        let divisor = divisors[i]!;
        let r = i-1...i+1;
        let n = digitsToInt(d[r])
        if n % divisor != 0 {
            return false;
        }
    }
    return true;
}

// https://github.com/apple/swift-algorithms/blob/main/Guides/Permutations.md

var sum = 0;
for d in digits.permutations() {
    if isProperlyDivisble(d) {
        let n = digitsToInt(d);
        print(n)
        sum += n;
    }
}

print("total sum: \(sum)")
