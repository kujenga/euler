// https://projecteuler.net/problem=44

fn pentagonal(n: i64) -> i64 {
    return n * (3 * n - 1) / 2;
}

fn perf_square(n: i64) -> Option<i64> {
    let s = (n as f64).sqrt();
    let floor = s.floor() as i64;
    if floor * floor == n {
        return Some(floor);
    }
    let ceil = s.ceil() as i64;
    if ceil * ceil == n {
        return Some(ceil);
    }
    return None;
}

fn is_pentagonal(p: i64) -> bool {
    // quadratic formula on pentagonal
    // n=(1+√(1+24p))/6
    if let Some(sqrt) = perf_square(1 + 24 * p) {
        if (1 + sqrt) % 6 == 0 {
            return true;
        }
    }
    return false;
}

fn main() {
    let mut min_d = 1000000;
    // Distance has to be a pentagonal, so we iterate over those.
    for d in 1..2000 {
        let pd = pentagonal(d);
        // Iterate over the P_{j} anchor points for a given distance D, and see if the P_{k} point
        // is also pentagonal.
        for j in 1..10000 {
            let pj = pentagonal(j);

            // Pj <- D -> Pk
            let pk = pj + pd;
            if is_pentagonal(pk) {
                let ps = pj + pk; // sum
                let big_d = pk - pj;
                let ps_pentagonal = is_pentagonal(ps);
                if ps_pentagonal {
                    println!(
                        "pentagonal: d: {}, D: {}, pk: {}, j: {}, pj: {}, pd: {}, ps: {}/{}",
                        d, big_d, pk, j, pj, pd, ps, ps_pentagonal,
                    );
                    if d < min_d && d > 0 {
                        min_d = d;
                    }
                }
            }
        }
    }

    println!("min D: {}", min_d);
}

#[cfg(test)]
mod tests {
    // Note this useful idiom: importing names from outer (for mod tests) scope.
    use super::*;

    #[test]
    fn test_pentagonal() {
        assert_eq!(pentagonal(1), 1);
        assert_eq!(pentagonal(2), 5);
        assert_eq!(pentagonal(3), 12);
        assert_eq!(pentagonal(8), 92);
    }

    #[test]
    fn test_is_pentagonal() {
        // Pentagonal
        assert!(is_pentagonal(1));
        assert!(is_pentagonal(5));
        assert!(is_pentagonal(12));
        assert!(is_pentagonal(92));
        // Not pentagonal
        assert!(!is_pentagonal(8));
    }

    #[test]
    fn test_perf_square() {
        // Square
        assert_eq!(perf_square(4).unwrap(), 2);
        assert_eq!(perf_square(16).unwrap(), 4);
        assert_eq!(perf_square(100).unwrap(), 10);
        // Not square
        assert!(perf_square(3).is_none())
    }
}
