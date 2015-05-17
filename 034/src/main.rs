#[test]
fn test_rec_factorial() {
    assert!(factorial(1) == 1);
    assert!(factorial(5) == 120);
    assert!(factorial(8) == 40320);
}

fn factorial(x: i32) -> i32 {
    if x < 1 {
        return 1;
    }
    return x * factorial(x-1);
}

#[test]
fn test_sum_digit_facts() {
    assert!(sum_digit_facts(145) == 145);
}

fn sum_digit_facts(x: i32) -> i32 {
    let mut sum = 0;
    let mut v = x;
    while v > 0 {
        sum += factorial(v%10); 
        v = v / 10;
    }
    sum
}

fn main() {
    let mut x = 3;
    let mut sum = 0;
    // limit at the point where factorials will always be less than the number itself
    while x < 9999999 {
        print!("\rx: {}", x);
        let ds = sum_digit_facts(x);
        if x == ds {
            sum += ds;
            println!("\rsum: {}", sum);
        }
        x += 1;
    }
    println!("\rdone after {} iterations", x)
}
