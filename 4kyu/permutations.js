function permutations(string) {
  var arr = string.split('');
  var ans = [];
  var dt = {};
  perm(0, arr.length);
  
  return ans;
  function perm(m, n) {
    if(m >= n) {
      var s = arr.join('');
      if(typeof dt[s] == 'undefined') {
        ans.push(s);
        dt[s] = 1;
      }
      return;
    } else {
      for(var i = m; i < n; i++) {
        var t = arr[i];
        arr[i] = arr[m];
        arr[m] = t;
        perm(m+1, n);
        t = arr[i];
        arr[i] = arr[m];
        arr[m] = t;
      }
    }
  }
}
