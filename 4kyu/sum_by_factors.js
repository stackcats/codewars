function genPrimes(n) {
  n = Math.abs(n);
  if (n < 2) return [];
  const arr = new Array(n + 1);
  for (let i = 2; i <= n; i++) {
    arr[i] = 1;
  }

  for (let i = 2; i <= n; i++) {
    if (arr[i]) {
      for (let k = i + i; k <= n; k += i) {
        arr[k] = 0;
      }
    }
  }

  const ans = [];
  for (let i = 2; i <= n; i++) {
    if (arr[i]) ans.push(i);
  }
  return ans;
}

function sumOfDivided(lst) {
  if (lst.length === 0) return [];
  const slst = lst.sort((a, b) => Math.abs(a) - Math.abs(b));
  const primes = genPrimes(slst[lst.length - 1]);
  const ans = [];
  const obj = {};
  for (const p of primes) {
    let sum = 0;
    for (let i = 0; i < lst.length; i++) {
      const x = lst[i];
      if (x % p === 0) {
        obj[p] = 1;
        sum += x;
      }
    }

    const a = [p, sum];
    ans.push(a.slice(0));
  }
  return ans.filter(a => obj[a[0]] === 1);
}
