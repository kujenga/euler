extern crate euler;

use euler::is_prime;

fn main() {
    // Pre-compute list of primes
    let mut primes = Vec::new();
    for n in 1..1000000 {
        if is_prime(n) {
            primes.push(n);
        }
    }

    println!("Brute-forcing over {} primes < 1,000,000", primes.len());

    let mut most = 0;
    let mut most_val = 0;

    for a in 0..primes.len() {
        println!("start: {}", a);
        'sum: for b in (a + 1)..primes.len() {
            let mut sum = 0;
            for i in a..b {
                sum += primes[i];
                if sum > 1000000 {
                    continue 'sum;
                }
            }
            if sum > most_val && b - a > most {
                if is_prime(sum) {
                    most = b - a;
                    most_val = sum;
                    println!("new record! {} for {} primes, {}..{}", most_val, most, a, b);
                }
            }
        }
    }

    // NOTE: This will take a long time to terminate, but we do not need it to, as we can just try
    // the last one that pops out from above, which Project Euler tells us is correct!

    println!("prime sum: {} for {} primes", most_val, most);
}
