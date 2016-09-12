function nextBigger(n) {
  let arr = String(n).split('');
  arr = arr.map(Number);
  let ans = [];
  for (let i = arr.length - 2; i >= 0; i--) {
    const a = arr[i];
    const b = arr[i + 1];
    if (a < b) {
      ans = ans.concat(arr.slice(0, i));
      const rest = arr.slice(i + 1);
      const m = Math.min(...rest.filter(t => t > a));
      ans.push(m);
      const ndx = rest.indexOf(m);
      rest.splice(ndx, 1);
      rest.unshift(arr[i]);
      rest.sort((r1, r2) => Number(r1) - Number(r2));
      ans = ans.concat(rest);
      break;
    }
  }
  if (ans.length === 0) return -1;
  return Number(ans.join(''));
}
