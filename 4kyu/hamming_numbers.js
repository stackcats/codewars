let ans = [];
const obj = {};
const magic = 50837316566580; // https://oeis.org/A051037/b051037.txt
function hamming (n) {
  // TODO: Program me
  if (ans.length > 0) return ans[n - 1];
  for (let i = 0; i < 46; i++) {
    const a = 2 ** i;
    for (let j = 0; j < 29; j++) {
      const b = 3 ** j;
      if (a * b > magic) {
        break;
      }
      for (let k = 0; k < 20; k++) {
        const c = 5 ** k;
        const t = a * b * c;
        if (t > magic) {
          break;
        }
        if (obj[t] === undefined) {
          ans.push(a * b * c);
          obj[t] = 1;
        }
      }
    }
  }
  ans = ans.sort((a, b) => a - b);
  console.log(ans.length);
  return ans[n - 1];
}
