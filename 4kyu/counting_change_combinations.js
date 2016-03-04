//sicp 经典例题
var countChange = function(money, coins) {
  // your implementation here
  coins.sort((a, b) => b - a);
  var ans = 0;
  ans = cc(money, 0, coins);
  return ans;
}

function cc(amount, idx, coins) {
  if(amount == 0)
    return 1;
  else if(amount < 0 || idx >= coins.length)
    return 0;
  else {
    return cc(amount, idx+1, coins) + cc(amount - coins[idx], idx, coins);
  }
}
