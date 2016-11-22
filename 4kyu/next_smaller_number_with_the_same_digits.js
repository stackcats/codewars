function nextSmaller(n) {
  const arr = String(n).split('').map(Number);
  for (let i = arr.length - 2; i >= 0; i--) {
    if (arr[i] > arr[i + 1]) {
      let m = -1;
      let ndx = -1;
      for (let j = i + 1; j < arr.length; j++) {
        if (arr[j] < arr[i] && m < arr[j]) {
          m = arr[j];
          ndx = j;
        }
      }
      if (i === 0 && m === 0) continue;
      arr[ndx] = arr[i];
      arr[i] = m;
      let rest = arr.slice(i + 1);
      rest = rest.sort((a, b) => b - a);
      let ret = ''; // 如果用数字累加求和 js处理大数精度有问题 所以先用字符串再转数字
      for (let k = 0; k <= i; k++) {
        ret += arr[k];
      }
      for (const r of rest) {
        ret += r;
      }
      return +ret;
    }
  }
  return -1;
}
