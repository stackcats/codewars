function add(s1, s2) {
  s1 = `${s1}`.split('').reverse();
  s2 = `${s2}`.split('').reverse();
  const arr = [];
  let i = 0;
  let j = 0;
  let carry = 0;
  while (i < s1.length && j < s2.length) {
    const n = carry + +s1[i] + +s2[j];
    arr.push(n % 10);
    carry = ~~(n/10);
    i += 1;
    j += 1;
  }

  while (i < s1.length) {
    const n = carry + +s1[i];
    arr.push(n % 10);
    carry = ~~(n/10);
    i += 1;
  }

  while (j < s2.length) {
    const n = carry + +s2[j];
    arr.push(n % 10);
    carry = ~~(n/10);
    j += 1;
  }

  if (carry > 0) arr.push(carry);
  
  return arr.reverse().join('');
}

function mul(s1, s2) {
  s1 = `${s1}`.split('').reverse();
  s2 = `${s2}`.split('').reverse();
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

function sub(s1, s2) {
  s1 = `${s1}`.split('').reverse().map(a => +a);
  s2 = `${s2}`.split('').reverse().map(a => +a);

  for (let i = 0; i < s1.length; i += 1) {
    if (i >= s2.length) break;
    
    if (s1[i] < s2[i]) {
      s1[i+1] -= 1;
      s1[i] += 10;
    }
    s1[i] -= s2[i];
  }

  while (s1[s1.length - 1] === 0 && s1.length > 1) s1.pop();
  return s1.reverse().join('');
}

function cmp(s1, s2) {
  if (s1.length > s2.length) return 1;
  if (s1.length < s2.length) return -1;
  if (s1 > s2) return 1;
  if (s1 < s2) return -1;
  return 0;
}

function integerSquareRoot(ns) {
  const arr = [];
  for (let i = ns.length - 2; i >= -1; i -= 2) {
    if (i < 0) {
      arr.unshift(ns[0]);
    } else {
      arr.unshift(ns.slice(i,i + 2));
    }    
  }
  let ans = '';
  let rem = 0;
  for (let i = 0, il = arr.length; i < il; i++) {
    const n = add(arr[i], mul(rem, 100));
    let divisor = ans;
    divisor = mul(divisor, 20);
    let x = 0;
    while (true) {
      const small = mul(add(divisor, x), x);
      const big = mul(add(divisor, add(x, 1)), add(x, 1));
      if (cmp(small, n) <= 0 && cmp(big, n) > 0) break;
      x = add(x, 1);
    }
    divisor = add(divisor, x);
    ans = ans + x;
    rem = sub(n, mul(divisor, x));
  }
  return ans;
}
