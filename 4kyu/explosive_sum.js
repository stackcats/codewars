
function sum(num) {
  if(num <= 0) return 0;
  var dp = [[]];
  var ans = cc(dp, num, 1, num);
  
  return ans;
}

function cc(dp, n, m) {
  if(n == 1 || m == 1) {
    dp[n][m] = 1;
    return 1;
  }
  if(n < m) {
    dp[n][m] = cc(dp, n, n);
    return dp;
  }

  if(dp[n] && dp[n][m])
    return dp[n][m];
  if(n == m) {
    dp[n][m] = 1 + cc(dp, n, m-1);
    return dp[n][m];
  }
  
  dp[n][m] = cc(n, m-1) + cc(n-m, m);
  return dp[n][m];
}
