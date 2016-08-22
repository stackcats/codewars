function pascalsTriangle(n) {
  if (n === 0) return [];
  if (n === 1) return [1];
  const ans = [1];
  let row = [1];
  let i = 2;
  while (i <= n) {
    const t = new Array(i);
    for (let j = 0; j < i; j++) {
      if (j === 0 || j === i - 1) t[j] = 1;
      else t[j] = row[j - 1] + row[j];
      ans.push(t[j]);
    }
    row = t;
    i++;
  }
  return ans;
}
