extern crate prime_factorization;

use prime_factorization::Factorization;
use std::collections::{HashMap, HashSet};

fn main() {
    let size = 4;

    // let mut i: u32 = 2;
    let mut q: usize = 0;
    let mut last_facs: Vec<HashMap<u32, u32>> = Vec::with_capacity(size);
    'outer: for i in 2..1000000000 {
        let f = Factorization::run(i);
        let fs = f.factors.into_iter().fold(HashMap::new(), |mut map, d| {
            *map.entry(d).or_insert(0) += 1;
            map
        });
        let count = fs.len();
        if q >= last_facs.len() {
            last_facs.push(fs);
        } else {
            last_facs[q] = fs;
        }

        // Queue iterateor always replacing next spot in the queue.
        q = (q + 1) % size;

        // Only care about len "size"
        if count != size {
            continue;
        }

        // Check if all prime factors in last_facs of expectes size and distinct.
        if last_facs.len() == size {
            let mut distinct: HashSet<u32> = HashSet::new();
            for fac in &last_facs {
                if fac.len() != size {
                    continue 'outer;
                }
                for (d, c) in fac {
                    let v = d * c;
                    if distinct.contains(&v) {
                        continue 'outer;
                    }
                    distinct.insert(v);
                }
            }
            // All prime factors distinct!
            println!("winner!: {}..{} -> {:?}", i - size as u32 + 1, i, last_facs);
            break;
        }
    }
}
