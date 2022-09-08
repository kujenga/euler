// https://projecteuler.net/problem=41

import Euler

var largest = 0;

for N in 1...9 {
    // QuickPerm
    // https://www.quickperm.org/
    var a: [Int] = [];
    // Pandigital set of digits, based on problem statement.
    for d in 1...N {
        a.append(d);
    }
    var p: [Int] = [];
    for d in 0...N {
        p.append(d);
    }
    var i = 1;

    // Permute
    while i < N {
        // decrement p[i] by 1
        p[i] -= 1
        // if i is odd, then let j = p[i] otherwise let j = 0
        let j = p[i]%2 != 0 ? p[i] : 0;
        // swap(a[j], a[i])
        a.swapAt(j, i)
        // let i = 1
        i = 1
        // while (p[i] is equal to 0) do {
        while p[i] == 0 {
            // let p[i] = i
            p[i] = i
            // increment i by 1
            i += 1
        }

        let x = digitsToInt(a)
        if x.isPrime() {
            print("is prime: \(x)")
            if x > largest {
                largest = x;
            }
        }
    }
}

print("largest pandigital prime: \(largest)")
