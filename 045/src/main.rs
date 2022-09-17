fn triangle(n: u64) -> u64 {
    return n * (n + 1) / 2;
}

fn pentagonal(n: u64) -> u64 {
    return n * (3 * n - 1) / 2;
}

fn hexagonal(n: u64) -> u64 {
    return n * (2 * n - 1);
}

fn main() {
    println!("Hello, world!");
    let mut t = 1;
    let mut p = 1;
    let mut h = 1;
    loop {
        let tn = triangle(t);
        let pn = pentagonal(p);
        let hn = hexagonal(h);
        // println!("t={}, p={}, h={} -> {}, {}, {}", t, p, h, tn, pn, hn);
        if tn == pn && tn == hn {
            println!("Equal! t={}, p={}, h={} -> {}", t, p, h, tn);
            t += 1;
        } else if tn <= pn && tn <= hn {
            t += 1;
        } else if pn <= tn && pn <= hn {
            p += 1;
        } else if hn <= tn && hn <= pn {
            h += 1;
        } else {
            panic!(
                "invalid ordering... t={}, p={}, h={} -> {}, {}, {}",
                t, p, h, tn, pn, hn
            );
        }
    }
}
