function toPostfix (infix) {
  // Convert infix to postfix here, and return result.
  var prior = {
    '+': 1,
    '-': 1,
    '*': 2,
    '/': 2,
    '(': 0,
    '^': 3
  };
  
  var st = [];
  var postfix = [];
  for(var i = 0; i < infix.length; i++) {
    var ch = infix[i];
    var op;
    if(ch == '(') {
      st.push(ch);
    } else if(ch == ')') {
      op = st.pop();
      while(op != '(') {
        postfix.push(op);
        op = st.pop();
      }
    } else if(/\d/.test(ch)) {
      postfix.push(ch);
    } else {
      while(st.length > 0 && prior[st[st.length-1]] >= prior[ch]) {
        postfix.push(st.pop());
      }
      st.push(ch);
    }
  }
  
  while(st.length > 0) {
    postfix.push(st.pop());
  }
  return postfix.join('');
}
