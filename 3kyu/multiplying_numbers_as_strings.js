function multiply(a, b) {
  s1 = `${a}`.split('').reverse();
  s2 = `${b}`.split('').reverse();
  const arr = new Array(s1.length + s2.length);
  for (let i = 0; i < arr.length; i++) {
    arr[i] = 0;
  }
  
  for (let i = 0; i < s1.length; i += 1) {
    for (let j = 0; j < s2.length; j += 1) {
      arr[i+j] += s2[j] * s1[i];
    }
  }

  for (let i = 0; i < arr.length; i++) {
    if (arr[i] >= 10) {
      arr[i + 1] += ~~(arr[i] / 10);
      arr[i] %= 10;
    }
  }
  while (arr[arr.length - 1] === 0 && arr.length > 1) arr.pop();
  return arr.reverse().join('');  
}
