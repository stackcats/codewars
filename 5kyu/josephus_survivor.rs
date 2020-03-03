fn josephus_survivor(n: i32, k: i32) -> i32 {
    let mut p = 0;
    for i in 2..=n {
      p = (p + k) % i;
    }
    p + 1
}
