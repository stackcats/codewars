function add(a, b) {
  
  // 和sum strings as numbers 一样
  a = a.replace(/^0*/, '');
  b = b.replace(/^0*/, '');
  
  var ia = a.length - 1;
  var ib = b.length - 1;
  var arr = [];
  var carry = 0;
  while(ia >= 0 && ib >= 0) {
    var n = parseInt(a[ia]) + parseInt(b[ib]) + carry;
    arr.push(n%10);
    carry = Math.floor(n/10);
    ia--;
    ib--;
  }
  while(ia >= 0) {
    var n = parseInt(a[ia]) + carry;
    arr.push(n%10);
    carry = Math.floor(n/10);
    ia--;
  }
  while(ib >= 0) {
    var n = parseInt(b[ib]) + carry;
    arr.push(n%10);
    carry = Math.floor(n/10);
    ib--;
  }
  var head = carry == 1 ? '1' : '';
  return head + arr.reduce(function(a, b) {
    return b + a;
  }, '');
}
