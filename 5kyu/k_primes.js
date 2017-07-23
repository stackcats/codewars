const end = 10500000;
const arr = [];
const p1 = [];
const p3 = [];
const p7 = [];
for (let i = 0; i <= end; i += 1) {
  arr[i] = 0;
}

for (let i = 2; i <= end; i += 1) {
  if (arr[i] === 0) {
    for (let j = i; j <= end; j += i) {
      let x = j;
      while (x % i === 0) {
        arr[j] += 1;
        x /= i;
      }
    }
  }
  if (arr[i] === 1) {
    p1.push(i);
  } else if (arr[i] === 3) {
    p3.push(i);
  } else if (arr[i] === 7) {
    p7.push(i);
  }
}

function countKprimes(k, start, nd) {
  const ans = [];

  while (start <= nd) {
    if (arr[start] === k) {
      ans.push(start);
    }
    start += 1;
  }
  return ans;
}


function puzzle(s) {
  const x1 = [];
  const x3 = [];
  const x7 = [];
  let i = 0;
  while (p1[i] < s) {
    x1.push(p1[i]);
    i += 1;
  }

  i = 0;
  while (p3[i] < s) {
    x3.push(p3[i]);
    i += 1;
  }

  i = 0;
  while (p7[i] < s) {
    x7.push(p7[i]);
    i += 1;
  }

  let ct = 0;
  for (i = 0; i < x1.length; i++) {
    for (let j = 0; j < x3.length; j++) {
      for (let k = 0; k < x7.length; k++) {
        if (x1[i] + x3[j] + x7[k] === s) ct++;
      }
    }
  }
  return ct;
}
