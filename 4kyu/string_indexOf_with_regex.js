String.prototype.indexOf = function(re, ndx = 0){
  if (typeof re === 'string') {
    re = new RegExp(re, 'g');
  }
  const s = re.toString();
  if (s[1] === '^') ndx = 0;
  const x = re[Symbol.search](this.slice(ndx));
  return x < 0 ? -1 : x + ndx;
};

String.prototype.lastIndexOf = function(re, ndx){
  let s = re.toString().replace(/\//g, '');
  if (ndx === undefined) ndx = this.length - 1;
  if (s[0] !== '^') s = '^' + s;
  else ndx = 0;
  re = new RegExp(s, 'g');
  for (let i = ndx; i >= 0; i--) {
    const str = this.slice(i);
    if (re.test(str)) return i;
  }
  return -1;
};
