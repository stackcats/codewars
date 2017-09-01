function add2(a, b){
  a = String(a);
  b = String(b);
  const ar = a.split('').reverse().join('').split('.');
  if (ar.length > 2) return NaN;
  const br = b.split('').reverse().join('').split('.');
  if (br.length > 2) return NaN;
  let ans = '';
  let c = 0;
  let i = ar[0].length;
  let j = br[0].length;
  while (i > j) {
    br[0] = '0' + br[0];
    j++;
  } 
  while (i < j) {
    ar[0] = '0' + ar[0];
    i++;
  }
  i = 0;
  j = 0;
  while (i < ar[0].length && j < br[0].length) {
    const n = +ar[0][i] + +br[0][j] + c;
    ans += n % 10;
    c = ~~(n/10);
    i++;
    j++;
  }
  while (i < ar[0].length) {
    const n = +ar[0][i] + c;
    ans += n % 10;
    c = ~~(n/10);
    i++;
  }
  while (j < br[0].length) {
    const n = +br[0][j] + c;
    ans += n % 10;
    c = ~~(n/10);
    j++;
  }
  ans += '.';
  i = 0;
  j = 0;

  while (i < ar[1].length && j < br[1].length) {
    const n = +ar[1][i] + +br[1][j] + c;
    ans += n % 10;
    c = ~~(n/10);
    i++;
    j++;
  }
  while (i < ar[1].length) {
    const n = +ar[1][i] + c;
    ans += n % 10;
    c = ~~(n/10);
    i++;
  }
  while (j < br[1].length) {
    const n = +br[1][j] + c;
    ans += n % 10;
    c = ~~(n/10);
    j++;
  }
  if (c > 0) ans += c;
  const s = ans.split('').reverse().join('').replace(/(^0*)|(0*$)/g, '');
  if (s[0] === '.') return '0' + s;
  return s;
}

function add(...arg) {
  let ans = '0.0';
  for (const n of arg) {
    let s = String(n);
    if (s.indexOf('.') === -1) s += '.0';
    const x = add2(ans, s);
    if (isNaN(x)) return NaN;
    ans = x;
  }
  return ans.replace(/\.0*$/, '');
}
