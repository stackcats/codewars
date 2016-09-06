function removeNb(n) {
  const sum = (1 + n) * n / 2;
  const end = ~~Math.sqrt(sum) + 1;
  const ans = [];
  for (let i = 2; i < end; i++) {
    const b = (sum - i) / (i + 1);
    if (~~(b) === b && b < n) {
      ans.push([i, b]);
      ans.push([b, i]);
    }
  }
  return ans.sort((a, b) => {
    if (a[0] < b[0]) return -1;
    if (a[0] > b[0]) return 1;
    return a[1] - b[1];
  });
}
