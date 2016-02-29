function brainLuck(code, input){
  var data = [0];
  var dt = {};
  var st = [];
  for(var i = 0; i < code.length; i++) {
    if(code[i] == '[') {
      st.push(i);
    } else if(code[i] == ']') {
      var t = st.pop();
      dt[t] = i;
      dt[i] = t;
    }    
  }
  var dp = 0;
  var ip = 0;
  var output = '';
  var len = code.length;
  var cp = 0;

  while(cp < len) {
    switch(code[cp]) {
    case '>':
      dp++;
      if(typeof data[dp] === 'undefined') {
	data[dp] = 0;
      }
      break;
    case '<':
      dp--;
      if(dp < 0)
	dp = 0;
      break;
    case '+':
      data[dp]++;
      if(data[dp] > 255)
	data[dp] = 0;
      break;
    case '-':
      data[dp]--;
      if(data[dp] < 0)
	data[dp] = 255;
      break;
    case '.':
      output += String.fromCharCode(data[dp]);
      break;
    case ',':
      data[dp] = input[ip++].charCodeAt();
      break;
    case '[':
      if(data[dp] === 0)
	cp = dt[cp];
      break;
    case ']':
      if(data[dp] != 0) 
	cp = dt[cp];
      break;
    default:
      break;
    }

    cp++;
  }
  return output;
}
