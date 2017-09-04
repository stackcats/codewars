function zeroes(base, num){
  let ans = num;
  for (let i = 2, j = base; i <= base; i++) {
    if (j % i == 0) {
      let p = 0;
      while (j % i == 0) {
        p++;
        j = ~~(j/i);
      }
      let c = 0;
      let k = num;
      while (k/i > 0) {
        k = ~~(k/i);
        c += k;
      }
      ans = Math.min(ans, ~~(c/p));
    }
  }
  return ans;
}
