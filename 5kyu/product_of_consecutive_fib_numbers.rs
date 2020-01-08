fn product_fib(prod: u64) -> (u64, u64, bool) {
    let mut a = 0;
    let mut b = 1;
    while a * b < prod {
        let t = a;
        a = b;
        b += t;
    }

    (a, b, a * b == prod)
}
