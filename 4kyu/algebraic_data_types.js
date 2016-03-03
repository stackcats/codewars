function natToInt(nat) {
  
  var n = nat();
  var num = 0;
  while(typeof n !== 'undefined') {
    num++;
    n = n();
  }
  return num;
}

function intToNat(int) {
  var nat = zero;
  while(int-- > 0) {
    nat = succ(nat);
  }
  return nat;
}

function add(nat1, nat2) {
  //return zero;
  var b = nat2();
  if(typeof b === 'undefined')
    return nat1;
  else
    return add(succ(nat1), nat2());
}

function mul(nat1, nat2) {
  var b = nat2();
  if(typeof b == 'undefined')
    return zero;
  else {
    return add(nat1, mul(nat1, nat2()));
  }
}

function compareTo (nat1, nat2) {
  var a = nat1();
  var b = nat2();
  if(typeof a == 'undefined' && typeof b == 'undefined')
    return 0;
  if(typeof a == 'undefined')
    return -1;
  if(typeof b == 'undefined')
    return 1;
  return compareTo(nat1(), nat2());
}

function toString(nat) {
  var n = nat();
  if(typeof n == 'undefined')
    return 'zero';
  else 
    return 'succ(' + toString(nat()) + ')';
}
