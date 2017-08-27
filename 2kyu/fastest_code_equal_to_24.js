function operator(all, arr, ndx) {
  if (ndx === 3) {
    all.push(arr.map(a => a));
    return;
  }
  const ops = ['+', '-', '*', '/'];
  for (let i = 0; i < ops.length; i += 1) {
    arr.push(ops[i]);
    operator(all, arr, ndx + 1);
    arr.pop();
  }
}

const ops = [];

function insert(x, args) {
  const ans = [];
  for (let i = args.length; i >= 0; i -= 1) {
    const arr = args.map(a => a);
    arr.splice(i, 0, x);
    ans.push(arr);
  }
  return ans;
}

function permutation(...arr) {
  if (arr.length === 0) return [];
  const first = arr.shift();
  const rest = permutation(...arr);
  if (rest.length === 0) return insert(first, rest);
  let ans = [];
  rest.forEach((each) => {
    ans = ans.concat(insert(first, each));
  });
  return ans;
}

function doOp(a, b, op) {
  switch (op) {
    case '+': return a + b;
    case '-': return a - b;
    case '*': return a * b;
    case '/': return a / b;
    default: throw new Error('whats up');
  }
}

function compute(arr, op) {
  const [a, b, c, d] = arr;
  const [op1, op2, op3] = op;

  {
    // (a b) (c d)
    const x = doOp(a, b, op1);
    const y = doOp(c, d, op3);
    const z = doOp(x, y, op2);
    if (z === 24) return `(${a}${op1}${b})${op2}(${c}${op3}${d})`;
  }

  {
    // ((a b) c) d
    const x = doOp(a, b, op1);
    const y = doOp(x, c, op2);
    const z = doOp(y, d, op3);
    if (z === 24) return `((${a}${op1}${b})${op2}${c})${op3}${d}`;
  }

  {
    // a ((b c) d)
    const x = doOp(b, c, op2);
    const y = doOp(x, d, op3);
    const z = doOp(a, y, op1);
    if (z === 24) return `${a}${op1}((${b}${op2}${c})${op3}${d})`;
  }

  {
    // a (b (c d))
    const x = doOp(c, d, op3);
    const y = doOp(b, x, op2);
    const z = doOp(a, y, op1);
    if (z === 24) return `${a}${op1}(${b}${op2}(${c}${op3}${d}))`;
  }
  return '';
}

function equalTo24(a, b, c, d) {
  if (ops.length === 0) {
    operator(ops, [], 0);
  }

  let res = '';
  const per = permutation(a, b, c, d);
  for (const arr of per) {
    for (const op of ops) {
      res = compute(arr, op);
      if (res !== '') return res;
    }
  }
  return 'It\'s not possible!';
}
