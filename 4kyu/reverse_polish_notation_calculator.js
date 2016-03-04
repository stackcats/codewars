function calc(expr) {
  // TODO: Your awesome code here
  if(expr == '') return 0;
  var arr = expr.split(' ');
  var st = [];
  for(var i = 0; i < arr.length; i++) {
    var ch = arr[i];
    if(/\d/.test(ch))
      st.push(parseFloat(ch));
    else if(ch == '+') {
      st.push(st.pop() + st.pop());
    } else if(ch == '*') {
      st.push(st.pop() * st.pop());
    } else if(ch == '-') {
      var a = st.pop();
      st.push(st.pop() - a);
    } else {
      var a = st.pop();
      st.push(st.pop() / a);
    }
  }
  return st[st.length-1];
}
