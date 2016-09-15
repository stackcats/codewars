function nzero(n, flag) {
  let zeros = '';
  const ch = flag ? '0' : '1';
  while (n-- > 0) {
    zeros += ch;
  }
  return zeros;
}
Number.prototype.twos = function twos(n) {
  const zeros = nzero(n, this > 0);
  return `${zeros}${Math.abs(this).toString(2)}`.substr(-n);
};

