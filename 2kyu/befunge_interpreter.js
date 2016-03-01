function interpret(code) {
  var output = "";
  // TODO: Interpret the code!
  var arr = code.split('\n').map(function(each) {
    return each.split('');
  });
  
  var pos = { x: 0, y: 0 };
  var dir = 'right';
  var st = [];
  var strMode = false;
  
  while(true) {
    var val = arr[pos.x][pos.y];
    if(strMode) {
      if(val == '"') {
	strMode = false;
      } else {
	st.push(val.charCodeAt());
      }
      pos = nextPos(pos, dir);
      continue;
    }
    var a, b;
    switch(val) {
    case '+':
      st.push(st.pop() + st.pop());
      break;
    case '-':
      a = st.pop();
      st.push(st.pop() - a);
      break;
    case '*':
      st.push(st.pop() * st.pop());
      break;
    case '/':
      a = st.pop();
      b = st.pop();
      if(a == 0)
	st.push(0);
      else
	st.push(Math.floor(b/a));
      break;
    case '%':
      a = st.pop();
      b = st.pop();
      if(a == 0)
	st.push(0);
      else
	st.push(b%a);
      break;
    case '!':
      a = st.pop();
      if(a == 0)
	st.push(1);
      else
	st.push(0);
      break;
    case '`':
      a = st.pop();
      b = st.pop();
      if(b >= a)
	st.push(1);
      else
	st.push(0);
      break;
    case '>':
      dir = 'right';
      break;
    case '<':
      dir = 'left';
      break;
    case '^':
      dir = 'up';
      break;
    case 'v':
      dir = 'down';
      break;
    case '?':
      var r = Math.random() * 4;
      dir = ['up', 'down', 'left', 'right'][Math.floor(Math.random() * 4)];
      break;
    case '_':
      if(st.pop() == 0)
	dir = 'right';
      else
	dir = 'left';
      break;
    case '|':
      if(st.pop() == 0)
	dir = 'down';
      else
	dir = 'up';
      break;
    case '"':
      strMode = true;
      break;
    case ':':
      if(st.length == 0)
	st.push(0);
      else {
	a = st.pop();
	st.push(a);
	st.push(a);
      }
      break;
    case '\\':
      if(st.length == 1)
	st.push(0);
      else {
	a = st.pop();
	b = st.pop();
	st.push(a);
	st.push(b);
      }
      break;
    case '$':
      st.pop();
      break;
    case '.':
      output += st.pop();
      break;
    case ',':
      output += String.fromCharCode(st.pop());
      break;
    case '#':
      pos = nextPos(pos, dir);
      break;
    case 'p':
      a = st.pop();
      b = st.pop();
      arr[a][b] = String.fromCharCode(st.pop());
      break;
    case 'g':
      a = st.pop();
      b = st.pop();
      st.push(arr[a][b].charCodeAt());
      break;
    case '@':
      return output;
    case ' ':
      break;
    default:
      st.push(parseInt(val));
      break;
    }

    pos = nextPos(pos, dir);
  }
  return output;
}

function nextPos(pos, dir) {
  var dx = 0;
  var dy = 0;
  switch(dir) {
  case 'left':
    dy = -1;
    break;
  case 'right':
    dy = 1;
    break;
  case 'up':
    dx = -1;
    break;
  case 'down':
    dx = 1;
    break;
  }
  return {
    x: pos.x + dx,
    y: pos.y + dy
  };
}
//console.log(interpret('>987v>.v\nv456<  :\n>321 ^ _@'));

