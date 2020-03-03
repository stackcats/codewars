import 'dart:math';

Function cutLog = (List p, int n) {
  List<int> arr = List.generate(n+1, (_) => 0);
  
  for (int j = 1; j <= n; j++) {
    int q = -1;
    for (int i = 1; i <= j; i++) {
      q = max(q, p[i] + arr[j-i]);
    }
    arr[j] = q;
  }
  return arr[n];
};
