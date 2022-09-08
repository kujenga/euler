// https://projecteuler.net/problem=37

/**
 * See the following for references on package setup:
 * https://github.com/apple/example-package-dealer
 */

import Euler

func digits(_ n: Int) -> Int {
    var i = n;
    if i == 0 {
        return 1;
    }
    var count: Int = 0;
    while i != 0 {
        i /= 10;
        count += 1;
    }
    return count
}

func isTruncatable(_ i: Int) -> Bool {
    let count = digits(i);

    // We start with checking the smallest numbers for primality first
    for n in 1...count {
        // Check n leftmost digits
        let lm = i / pow(10, count - n);
        if !lm.isPrime() {
            /* print("lm not prime: \(lm) for: \(i)") */
            return false;
        }

        // Check n rightmost digits
        let rm = i % pow(10, n);
        if !rm.isPrime() {
            /* print("rm not prime: \(rm) for \(i)") */
            return false;
        }
    }

    return true;
}

@main
class Main {
    static func main() {
        var truncatablePrimes: [Int] = [];

        var n = 11;
        while truncatablePrimes.count < 11 {

            // Basic iteration
            if isTruncatable(n) {
                print("truncatable! \(truncatablePrimes.count): \(n)")
                truncatablePrimes.append(n);
            }
            n += 2;
        }

        let sum = truncatablePrimes.reduce(0) { $0 + $1 };
        print("truncatable primes sum: \(sum)")
    }
}
