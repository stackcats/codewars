use std::char;

fn dec2_fact_string(nb: u64) -> String {
    let mut n = nb;
    let mut res = String::new();
    let mut i = 1;
    while n > 0 {
      let r = n % i;
      res.push(char::from_digit(r as u32, 36).unwrap());
      n /= i;
      i += 1;
    }
    
    res.chars().rev().collect::<String>().to_uppercase()
}

fn fact(n: u64) -> u64 {
  let mut res = 1;
  for i in 1..=n {
    res *= i
  }
  res
}
fn fact_string_2dec(s: String) -> u64 {
    let mut sum = 0;
    let mut i = 0;
    for c in s.chars().rev() {
      let n:u64 = c.to_digit(36).unwrap() as u64;
      sum += n * fact(i);
      i += 1;
    }
    sum
}
