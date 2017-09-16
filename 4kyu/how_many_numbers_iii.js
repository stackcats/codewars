function find(n, k, x, s, ans) {
  if (n < 0 || k < 0) return;
  
  if (n === 0 && k === 0) {
   ans.push(s);
   return;
  }
  
  if (n / k > 9) return;
  
  for (let i = x; i < 10; i++) {
    find(n - i, k - 1, i, s + i, ans);
  }
}

function findAll(n, k) {
  const ans = [];
  find(n, k, 1, '', ans);
  if (ans.length === 0) return [];
  return [ans.length, ans[0], ans[ans.length-1]];
}
