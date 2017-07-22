function myFirstInterpreter(code) {
  let n = 0;
  let ans = '';
  for (const cmd of code) {
    if (cmd === '+') {
      n += 1;
      n %= 256;
    } else if (cmd === '.') {
      ans += String.fromCharCode(n);
    }
  }
  return ans;
}
