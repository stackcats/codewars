fn toValid(n: i32) -> i32 {
  if n < 0 {
    return 0;
  }
  if n > 255 {
    return 255;
  }
  n
}

fn rgb(r: i32, g: i32, b: i32) -> String {
  let r1 = toValid(r);
  let g1 = toValid(g);
  let b1 = toValid(b);
  format!("{:02X}{:02X}{:02X}", r1, g1, b1)
}
