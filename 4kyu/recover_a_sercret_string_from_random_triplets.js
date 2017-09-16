var recoverSecret = function(triplets) {
  const dt = {};
  const g = {};
  for (const [a, b, c] of triplets) {
    if (dt[a] === undefined) {
      dt[a] = 0;
    }
    if (dt[b] === undefined) {
      dt[b] = 0;
    }
    if (dt[c] === undefined) {
      dt[c] = 0;
    }
    dt[b]++;
    dt[c] += 2;
    if (g[a] === undefined) {
      g[a] = [];
    }
    if (g[b] === undefined) {
      g[b] = [];
    }
    if (g[c] === undefined) {
      g[c] = [];
    }
    g[a].push(b);
    g[a].push(c);
    g[b].push(c);
  }
  let arr = Object.keys(dt);
  let ans = '';
  while (arr.length > 0) {
    arr = arr.sort((a, b) => dt[b] - dt[a]);
    const c = arr.pop();
    ans += c;
    delete dt[c];
    for (const n of g[c]) {
      dt[n]--;
    }
  }
  return ans;
};
