// https://projecteuler.net/problem=37

/**
 * See the following for references on package setup:
 * https://github.com/apple/example-package-dealer
 */

var primes = Set<Int>([]);

func isPrime(_ i: Int) -> Bool {
    if primes.contains(i) {
        return true;
    }
    if i <= 1 {
        return false;
    }
    if i == 2 {
        return true;
    }
    for v in 2...(i/2+1) {
        if i%v == 0 {
            /* print("not prime!: \(i)%\(v) == 0"); */
            return false;
        }
    }
    /* print("prime discovered: \(i)") */
    primes.insert(i);
    return true;
}

func digits(_ n: Int) -> UInt {
    var i = n;
    if i == 0 {
        return 1;
    }
    var count: UInt = 0;
    while i != 0 {
        i /= 10;
        count += 1;
    }
    return count
}

func pow(_ base: Int, _ power: UInt) -> Int {
  var answer : Int = 1
  for _ in 0..<power { answer *= base }
  return answer
}

func isTruncatable(_ i: Int) -> Bool {
    let count = digits(i);

    // We start with checking the smallest numbers for primality first
    for n in 1...count {
        // Check n leftmost digits
        let lm = i / pow(10, count - n);
        if !isPrime(lm) {
            /* print("lm not prime: \(lm) for: \(i)") */
            return false;
        }

        // Check n rightmost digits
        let rm = i % pow(10, n);
        if !isPrime(rm) {
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
