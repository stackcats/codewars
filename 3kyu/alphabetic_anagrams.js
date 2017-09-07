function fac(n) {
  let ans = 1;
  while (n > 0) ans *= n--;
  return ans;
}

function repeat(iter) {
  const dt = {};
  for (const a of iter) {
    if (dt[a] === undefined) {
      dt[a] = 0;
    }
    dt[a]++;
  }
  return Object.keys(dt).reduce((a, b) => a * fac(dt[b]), 1);
}

function listPosition(word) {
  let res = 1;
  const arr = word.split('').sort();
  for (const w of word) {
    const ndx = arr.indexOf(w);
    res += fac(arr.length) * ndx / repeat(arr) / arr.length;
    arr.splice(ndx, 1);
  }
  return res;
}
