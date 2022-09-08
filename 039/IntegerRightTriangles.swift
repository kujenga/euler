// https://projecteuler.net/problem=39

func factors(_ n: Int) -> [Int] {
    var f: [Int] = [];
    for i in 1...n {
        if n % i == 0 {
            f.append(i);
        }
    }
    return f;
}

func isRightTriangle(a: Int, b: Int, c: Int) -> Bool {
    print("\(a)^2 + \(b)^2 = \(c)^2");
    return a*a + b*b == c*c;
}

struct Triangle {
    var ab: Int
    var c: Int
}

extension Triangle: Hashable {
    static func == (lhs: Triangle, rhs: Triangle) -> Bool {
        return lhs.ab == rhs.ab && lhs.c == rhs.c
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(ab)
        hasher.combine(c)
    }
}

func integerRightTriangles(_ p: Int) -> Int {
    // https://en.wikipedia.org/wiki/Pythagorean_triple#Generating_a_triple
    // yields the following for values of p:
    //
    //     m + n = p/(2km)
    //
    // Thus we must satisfy those conditions for this iteration.

    var triangles = Set<Triangle>([]);

    // p must devide cleanly into 2, as that is part of the formula.
    if p%2 != 0 {
        return 0;
    }

    for k in factors(p/2) {
        for m in factors(p/(2*k)) {
            let n = p/(2*k*m) - m;

            let a = k * (m*m - n*n);
            let b = k * 2 * n * m;
            let c = k * (m*m + n*n);
            if a <= 0 || b <= 0 || c <= 0 {
                continue;
            }
            /* print("a=\(a), b=\(b), c=\(c)) | k=\(k), m=\(m), n=\(n)"); */
            triangles.insert(Triangle(ab: a + b, c: c));
        }
    }

    return triangles.count;
}

var maxCount: Int = 0;
var best: Int = 0;
for p: Int in 3...1000 {
    let count = integerRightTriangles(p);
    print("p=\(p): \(count)")
    if count > maxCount {
        maxCount = count;
        best = p;
    }
}

print("best p=\(best) with count \(maxCount)")
