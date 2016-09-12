// f[n]=∑(-1)^(k-1)*(f[n-k*(3*k-1)/2]+f[n-k*(3*k+1)/2]) (k [1,n])
const mem = [1, 1];
function sum(n) {
  // console.log(n);
  if (n < 0) return 0;
  if (mem[n]) return mem[n];
  let ans = 0;
  for (let k = 1; k <= n; k++) {
    const a = n - k * (3 * k - 1) / 2;
    const b = n - k * (3 * k + 1) / 2;
    // console.log(a, b);
    ans += Math.pow(-1, k - 1) * (sum(a) + sum(b));
  }
  mem[n] = ans;
  return ans;
}
