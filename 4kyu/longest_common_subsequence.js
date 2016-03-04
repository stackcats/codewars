function LCS(x, y) {
  //TODO 
  console.log(x, y);
  var dp = [];
  for(var i = 0; i <= x.length; i++) {
    dp[i] = [];
    for(var j = 0; j <= y.length; j++) {
      dp[i][j] = 0;
    }
  }
  for(i = x.length - 1; i >= 0; i--) {
    for(j = y.length - 1; j >= 0; j--) {
      if(x[i] == y[j]) {
        dp[i][j] = dp[i+1][j+1] + 1;
      } else {
        dp[i][j] = Math.max(dp[i+1][j], dp[i][j+1]);
      }
    }
  }
  
  var ans = '';
  i = 0; j = 0;
  while(i < x.length && j < y.length) {
    if(x[i] == y[j]) {
      ans += x[i];
      i++; j++;
    } else if(dp[i+1][j] >= dp[i][j+1]) {
      i++;
    } else {
      j++;
    }
  }
  //console.log(dp);
  return ans;
}
