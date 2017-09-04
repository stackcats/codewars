int zeroes(base, num){
  int ans = num;
  for (int i = 2, j = base; i <= base; i++) {
    if (j % i == 0) {
      int p = 0;
      while (j % i == 0) {
        p++;
        j /= i;
      }
      int c = 0;
      int k = num;
      while (k/i > 0) {
        k /= i;
        c += k;
      }
      int tmp = c/p;
      if (ans > tmp) ans = tmp;
    }
  }
  return ans;
}
