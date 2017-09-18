function fun(obj, tokens, value) {
  if (tokens.length === 0) {
    return value;
  }
  const tk = tokens.shift();
  if (obj[tk] === undefined) {
    if (/\d+/.test(tk)) {
      obj = [];
    } else {
      obj[tk] = {};
    }
  }
  obj[tk] = fun(obj, tokens, value);
  return obj;
}

function deepAssignment(obj, keyPath, value) {
  const reg = /\s*([\[\].]|[A-Za-z_][A-Za-z0-9_]*|[0-9]*)\s*/g;
  const tokens = keyPath.split(reg).filter(each => each !== '.' && each !== '[' && each !== ']' && !each.match(/^\s*$/));
  return fun(obj, tokens, value);
}

