fn add_two_fracts(a: (i64, i64), b: (i64, i64)) -> (i64, i64) {
  (a.0 * b.1 + b.0 * a.1, a.1 * b.1)
}

fn gcd(a: i64, b: i64) -> i64 {
  if a % b == 0 {
   return b;
  }
  gcd(b, a % b)
}

fn sum_fracts(l: Vec<(i64, i64)>) -> Option<(i64, i64)> {
    if l.len() == 0 {
      return None;
    }
    let ans = l.iter().fold((0, 1), |acc, x| add_two_fracts(acc, *x));
    let g = gcd(ans.0, ans.1);
    Some((ans.0/g, ans.1/g))
}
