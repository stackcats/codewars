// Converts a URL Query String into an object map
function convertQueryToMap(query) {
  // add your code here
  if(query.length == 0)
    return {};
  var arr = query.split('&');
  var out = {};
  arr.forEach(function(arg) {
    var arr = arg.split('=');
    var keys = arr[0];
    var val = arr[1];
    var key = keys.split('.');
    var parent = out;
    for(var i = 0; i < key.length - 1; i++) {
      var k = key[i]
      if(typeof parent[k] == 'undefined')      
        parent[k] = {};
      parent = parent[k];
    }
    parent[key[i]] = decodeUrl(val);
  });
  return out;
}

function decodeUrl(url) {
  var ans = '';
  for(var i = 0; i < url.length; i++) {
    var c = url[i];
    if(c == '%') {
      // 题目不需要考虑错误
      var n = parseInt(url[i+1] + url[i+2], 16);
      ans += String.fromCharCode(n);
      i+=2;
    } else {
      ans += c;
    }
  }
  return ans;
}
