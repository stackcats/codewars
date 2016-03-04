//字符串最短距离问题 而不是最长子序列问题！！！
function Dictionary(words) {
  this.words = words;
}

Dictionary.prototype.findMostSimilar = function(term) {
  // TODO: this is your task ;)
  var ans;
  var n = term.length;
  console.log(this.words);
  this.words.forEach(function(e) {
    var tmp = CSD(e, term);
    if(n > tmp) {
      n = tmp;
      ans = e;
    }
  });
  return ans;
}

function CSD(x, y) {
  //TODO 
  var dp = [];
  var len = Math.max(x.length, y.length);
  for(var i = 0; i <= len; i++) {
    dp[i] = [];
    for(var j = 0; j <= len; j++) {
      dp[i][j] = 0;
    }
  }
  
  for(var i = 0; i <= len; i++) {
    dp[i][0] = i;
    dp[0][i] = i;
  }
  
  for(i = 1; i <= x.length; i++) {
    for(j = 1; j <= y.length; j++) {
      if(x[i-1] == y[j-1]) {
        dp[i][j] = dp[i-1][j-1];
      } else {
        dp[i][j] = Math.min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1;
      }
    }
  }
  //console.log(dp);
  return dp[--i][--j];
}

