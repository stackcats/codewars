// 利用device.encode 暴力枚举
device.decode = function decode(w) {
  const _ = '_';
  let s = '';
  const code = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ .?,';
  let ans = '';
  const sign = '!@#$%^&*()_+-';
  for (let i = 0; i < w.length; i++) {
    const c = w[i];
    if (sign.indexOf(c) !== -1) {
      ans += c;
    } else {
      for (const e of code) {
        if (device.encode(s + e)[i] === c) {
          ans += e;
        }
      }
    }
    s += _;
  }
  return ans;
};
