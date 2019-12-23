fn sum_of_squared_divisors(n: u64) -> u64 {
    let mut i = 1;
    let mut sum = 0;
    while i * i <= n {
        if n % i == 0 {
            sum += i * i;
            let j = n / i;
            if i != j {
                sum += j * j;
            }
        }
        i += 1
    }
    sum
}

fn is_square(n: u64) -> bool {
    let f = n as f64;
    let m = f.sqrt().floor();
    m * m == f
}

fn list_squared(m: u64, n: u64) -> Vec<(u64, u64)> {
    let mut arr = Vec::new();
    for i in m..=n {
        let sum = sum_of_squared_divisors(i);
        if is_square(sum) {
            arr.push((i, sum))
        }
    }
    arr
}
