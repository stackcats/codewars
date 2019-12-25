fn span(content: &str, color: &str) -> String {
    format!("<span style=\"color: {}\">{}</span>", color, content)
}

fn wrap(str: &str, c: char) -> String {
    match c {
        'F' => span(&str, "pink"),
        'L' => span(&str, "red"),
        'R' => span(&str, "green"),
        '(' => String::from("("),
        ')' => String::from(")"),
        _ => span(&str, "orange"),
    }
}

pub fn highlight(code: &str) -> String {
   let mut last = code.chars().nth(0).unwrap();
   let mut content = String::from(last.to_string());
   let mut res = Vec::new();
   for c in code.chars().skip(1) {
       if c.is_digit(10) && last.is_digit(10) {
           content.push(c);
           last = c;
       } else if c == last && c != '(' && c != ')' {
           content.push(c);
           last = c;
       } else {
           res.push(wrap(&content, last));
           last = c;
           content = String::from(last.to_string());
       }
   }
   res.push(wrap(&content, last));
   res.join("")
}
