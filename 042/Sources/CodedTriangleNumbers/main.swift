/* https://projecteuler.net/problem=42 */

import Foundation
import SwiftCSV

func triangleNumber(_ n: Int) -> Int {
    let tmp = (n * (n + 1));
    assert(tmp%2 == 0, "must divide cleanly into 2")
    return tmp / 2
}

// t_{n} = ½n(n+1)
// ->
// 2*t_{n} = n^2+n
func isTriangleNumber(_ n: Int) -> Bool {
    var i = 1;
    var t = 0;
    while t < n {
        t = triangleNumber(i);
        if t == n {
            return true;
        }
        i += 1;
    }
    return false;
}

// 1-indexed position in alphabet, based on the problem statement:
//
//   SKY is 19 + 11 + 25 = 55 = t10
//
func alphaPlace(_ c: Character) -> Int {
    if c.isUppercase {
        return Int(c.asciiValue! - 64);
    } else {
        return Int(c.asciiValue! - 96);
    }
}

func isTriangleWord(_ s: String) -> Bool {
    let n = s.reduce(0, { x, c in x + alphaPlace(c) });
    let t = isTriangleNumber(n);
    print("word: \(s), triangle: \(t), n: \(n)")
    return t;
}

let data: CSV = try! CSV<Named>(url: URL(fileURLWithPath: "resources/words.txt"))

var count = 0;
for word in data.header {
    let isTriangle = isTriangleWord(word);
    if isTriangle {
        count += 1;
    }
}

print("triangle number count: \(count)")
