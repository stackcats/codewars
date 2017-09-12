class Node {
  constructor(weight, childs = []) {
    this.weight = weight;
    this.childs = new Set(childs);
    this.left = null;
    this.right = null;
  }

  union(other) {
    const w = this.weight + other.weight;
    const cs = new Set(this.childs);
    for (const c of other.childs) {
      cs.add(c);
    }
    return new Node(w, Array.from(cs));
  }

  has(c) {
    return this.childs.has(c);
  }
}

function find(node, c) {
  if (node === null) return '';
  if (node.left && node.left.has(c)) {
    return '0' + find(node.left, c);
  } else if (node.right && node.right.has(c)) {
    return '1' + find(node.right, c);
  }
  return '';
}

function build(freqs) {
  freqs = freqs.sort((a, b) => b[1] - a[1]).map(a => new Node(a[1], [a[0]]));
  while (freqs.length > 1) {
    const right = freqs.pop();
    const left = freqs.pop();
    const par = left.union(right);
    par.left = left;
    par.right = right;
    freqs.push(par);
    freqs.sort((a, b) => b.weight - a.weight);
  }
  return freqs[0];
}
// takes: String; returns: [ [String,Int] ] (Strings in return value are single characters)
function frequencies(s) {
  const dt = {};
  for (const c of s) {
    if (dt[c] === undefined) dt[c] = 0;
    dt[c]++;
  }
  return Object.keys(dt).map(key => [key, dt[key]]);
}

// takes: [ [String,Int] ], String; returns: String (with "0" and "1")
function encode(freqs, s) {
  if (freqs.length <= 1) return null;
  const tree = build(freqs);
  let ans = '';
  for (const c of s) {
    ans += find(tree, c);
  }
  return ans;
}

// takes [ [String, Int] ], String (with "0" and "1"); returns: String
function decode(freqs, bits) {
  if (freqs.length <= 1) return null;
  const tree = build(freqs);
  let s = '';
  let curr = tree;  
  for (const b of bits) {
    if (b === '0') {
      curr = curr.left;
    } else {
      curr = curr.right;
    }
    const arr = [...curr.childs];
    if (arr.length === 1) {
      s += arr[0];
      curr = tree;
    }
  }
  return s;
}
