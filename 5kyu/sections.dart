import 'dart:math';

int c(int k) {
  var sk = sqrt(k).toInt();
  if (sk * sk != k) return 0;
  int n = sk * k;
  
  Map<int, int> m = {};
  int i = 2;
  while (n >= i) {
   if (n % i == 0) {
     n ~/= i;
     m[i] = (m[i] ?? 0) + 1;
   } else {
     i++;
   }
  }
  return m.values.toList().fold(1, (a, x) => a * (x + 1));
}
