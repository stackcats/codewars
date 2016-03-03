// TODO: create UriBuilder object
/*
 Only alphanumerics [0-9a-zA-Z], 
 the special characters "$-_.+!*’()," [not including the quotes - ed], 
 and reserved characters "&/:;=?@" 
 used for their reserved purposes may be used unencoded within a URL.
 */
function encode(s) {
  var ans = '';
  var regex = /(\d|\w|[-$_.+!*'(),&/:;=?@])/;
  for(var i = 0; i < s.length; i++) {
    if(!regex.test(s[i])) {
      var n = s[i].charCodeAt();
      ans += '%' + n.toString(16);
    } else {
      ans += s[i];
    }
  }
  return ans;
}
function UriBuilder(uri) {
  this.params = {};
  var idx = uri.indexOf('?');
  if(idx == -1) {
    this.host = uri;
  } else {
    var arr = uri.substring(idx+1).split('&');
    for(var i = 0; i < arr.length; i++) {
      var kv = arr[i].split('=');
      this.params[kv[0]] = kv[1];
    }
    this.host = uri.substring(0, idx);
  }
}

UriBuilder.prototype.build = function() {
  var ans = this.host;
  var flag = true;
  for(var f in this.params) {
    var val = this.params[f].toString();
    if(flag) {
      ans += '?' + f + '=' + encode(val);
      flag = false;
    } else {
      ans += '&' + f + '=' + encode(val);
    }
    
  }
  return ans;
};
