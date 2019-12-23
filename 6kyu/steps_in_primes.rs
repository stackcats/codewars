fn step(g: i32, m: u64, n: u64) -> Option<(u64, u64)> {
    for i in m..=n {
        let j = i + g as u64;
        if is_prime(i) && is_prime(j) {
            return Some((i, j))
        }
    }
    None
}

fn is_prime(n: u64) -> bool {
    if n < 2 {
        return false;
    }

    if n == 2 {
        return true;
    }

    let mut i = 2;
    while i * i <= n {
        if n % i == 0 {
            return false;
        }
        i += 1;
    }

    true
}
