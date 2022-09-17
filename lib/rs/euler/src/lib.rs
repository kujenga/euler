extern crate num;

pub fn is_prime<T>(n: T) -> bool
where
    T: num::PrimInt + std::iter::Sum,
{
    // Trick from:
    // https://stackoverflow.com/a/26811100/2528719
    let _0 = T::zero();
    let _1 = T::one();
    let _2 = _1 + _1;
    let _3 = _2 + _1;
    let _5 = _2 + _3;
    let _6 = _3 + _3;

    if n == _2 || n == _3 {
        return true;
    }
    if n <= _1 || n % _2 == _0 || n % _3 == _0 {
        return false;
    }
    let mut i = _5;
    while i * i <= n {
        if n % i == _0 || n % (i + _2) == _0 {
            return false;
        }
        i = i + _6;
    }
    return true;
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::collections::HashSet;

    #[test]
    fn it_works() {
        // List of primes under 100
        // From https://en.wikipedia.org/wiki/List_of_prime_numbers#The_first_1000_prime_numbers
        let primes100 = HashSet::from([
            2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83,
            89, 97,
        ]);

        for n in 0..100 {
            if primes100.contains(&n) {
                // Assert on default i32
                assert_eq!(is_prime(n), true);
            } else {
                assert_eq!(is_prime(n), false);
            }
        }
    }
}
