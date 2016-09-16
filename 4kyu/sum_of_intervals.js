function overlap(a, b) {
  if (a[0] <= b[0] && b[0] <= a[1]) return true;
  if (b[0] <= a[0] && a[0] <= b[1]) return true;
  return false;
}

function merge(a, b) {
  const ans = [Math.min(a[0], b[0]), Math.max(a[1], b[1])];
  console.log(a, b);
  return ans;
}

function sumIntervals(intervals) {
  const ans = [];
  for (let interval of intervals) {
    for (let i = ans.length - 1; i >= 0; i--) {
      // 不断合并重合的区间
      if (overlap(interval, ans[i])) {
        const tmp = ans.splice(i, 1);
        interval = merge(interval, tmp[0]); // splice 返回的为array 所以需要tmp[0]
      }
    }
    ans.push(interval);
  }
  return ans.reduce((a, b) => a + b[1] - b[0], 0);
}
