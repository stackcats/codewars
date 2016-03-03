// 实现很烂  需要优化
function decompose(n) {
  // your code
  var arr = [];
  var visited = [];
  for(var i = n - 2; i >= 0; i--) {
    arr.push((i+1)*(i+1));
    visited[i] = 0;
  }
  //console.log(arr);
  var ret = dfs(-1, n * n, arr, visited);
  //console.log(visited);
  if(ret) {
    var ans = [];
    for(i = 0; i < n - 1; i++) {
      if(visited[i])
        ans.unshift(n-i-1);
    }
    return ans;
  }
  else
    return null;
}

function dfs(idx, n, arr, visited) {
  if(n < 0)
    return false;
  
  if(n == 0)
    return true;
  
  var ret;
  for(var i = idx + 1; i < arr.length; i++ ) {
    visited[i] = 1;
    var t = n - arr[i];
    
    ret = dfs(i, t, arr, visited);
    if(ret) {
      return true;
    } 
    
    visited[i] = 0;
  }
  return false;
}
