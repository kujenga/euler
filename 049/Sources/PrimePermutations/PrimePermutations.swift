import Euler

func digitSet(_ n: Int) -> Set<Int> {
    var x = n;
    var s: Set<Int> = Set([]);
    while x > 0 {
        s.insert(x%10);
        x /= 10;
    }
    return s
}

func permutedDigits(_ digits: Int...) -> Bool {
    let digitSets = digits.map(digitSet);
    /* print(digitSets) */
    if let first = digitSets.first {
        for s in digitSets {
            if first != s {
                return false
            }
        }
    } else {
        return false
    }
    return true
}

@main
public struct PrimePermutations {
    public static func main() {
        var start = 1000
        var step = 1

        while true {
            if start > 9999 {
                break
            }
            if !start.isPrime() {
                start += 1;
                continue
            }
            let second = start + step;
            let third = start + step + step;
            /* print("checking: \(start), \(second), \(third)"); */
            if third >= 10000 {
                // Stay within 4 digits.
                start += 1;
                step = 1;
                continue
            }
            if !(second.isPrime() && third.isPrime()) {
                step += 1;
                continue
            }
            if permutedDigits(start, second, third) {
                print("permuted primes: \(start), \(second), \(third)");
            }
            step += 1;
        }
    }
}
