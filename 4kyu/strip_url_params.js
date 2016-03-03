function stripUrlParams(url, paramsToStrip){
  // complete me
  var idx = url.indexOf('?');
  if(idx == -1)
    return url;
  var arr = url.substring(idx+1).split('&');
  var params = paramsToStrip || [];
  var ans = [];
  var ret = url.substring(0, idx);
  var flag = true;
  arr.forEach(function(p) {
    if(ans.indexOf(p[0]) == -1 && params.indexOf(p[0]) == -1) {
      if(flag)
        ret += '?' + p;
      else
        ret += '&' + p;
      flag = false;
      ans.push(p[0]);
    }
  });
  return ret;
}
