 use std::cmp::Ordering::Equal;
 
fn meeting(s: &str) -> String {
    let s = s.to_uppercase();
    let mut names: Vec<Vec<&str>> = s
        .split(";").collect::<Vec<&str>>().iter()
        .map(|name| name.split(":").collect())
        .collect();

    names.sort_by(|a, b| {
      let r = a[1].cmp(b[1]);
      if r == Equal {
        return a[0].cmp(b[0]);
      }
      r
    });
    
    let mut s = String::new();
    for i in names.iter() {
      s.push_str(format!("({}, {})", i[1], i[0]).as_str());
    }
    s
}
