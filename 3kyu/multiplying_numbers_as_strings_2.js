function sgin(s) {
  return s[0] === '-' ? -1 : 1;
}

function multiply(n, o) {
  let sn = sgin(n);
  let so = sgin(o);
  
  n = n.replace(/\-/, '').replace(/^0+/, '');
  o = o.replace(/\-/, '').replace(/^0+/, '');

  let nn = 0;
  let no = 0;
  
  if (n.indexOf('.') !== -1) {
    n = n.replace(/0+$/, '');
    nn = n.length - n.indexOf('.') - 1;
    n = n.replace(/\./, '');
  }

  if (o.indexOf('.') !== -1) {
    o = o.replace(/0+$/, '');
    no = o.length - o.indexOf('.') - 1;
    o = o.replace(/\./, '');
  }
  if (n === '') return '0';
  if (o === '') return '0';
  s1 = `${n}`.split('').reverse();
  s2 = `${o}`.split('').reverse();
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
  while (arr[arr.length - 1] === 0 && arr.length > 1)
    arr.pop();

  let ans = arr.reverse().join('');

  if (no + nn > 0) {
    let pos = ans.length - no - nn;
    while (pos < 0) {
      ans = '0' + ans;
      pos++;
    }
    pos = ans.length - no - nn;
    ans = ans.slice(0, pos) + '.' + ans.slice(pos);
  }
  if (ans[0] === '.') {
    ans = '0' + ans;
  }
  
  if (sn * so < 0) {
    ans = '-' + ans;
  }

  if (ans.indexOf('.') !== -1) {
    ans = ans.replace(/0*$/, '');
  }
  return ans.replace(/\.$/, '');
}
