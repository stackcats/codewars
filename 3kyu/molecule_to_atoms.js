function parse(arr) {
  const ans = {};
  for (let i = 0; i < arr.length; i++) {
    const obj = {};
    const ch = arr[i];
    if (ch === '(') {
      let flag = 1;
      for (let j = i + 1; j < arr.length; j++) {
        if (arr[j] === '(') {
          flag++;
        } else if (arr[j] === ')') {
          flag--;
        }
        if (flag === 0) {
          const tmp = arr.slice(i + 1, j);
          const res = parse(tmp);
          i = j;
          Object.keys(res).forEach(r => {
            obj[r] = res[r];
          });
          break;
        }
      }
    } else {
      obj[ch] = 1;
    }
    if (!isNaN(Number(arr[i + 1]))) {
      Object.keys(obj).forEach(o => {
        obj[o] *= Number(arr[i + 1]);
      });
      i++;
    }

    Object.keys(obj).forEach(o => {
      if (ans[o] !== undefined) {
        ans[o] += obj[o];
      } else {
        ans[o] = obj[o];
      }
    });
  }
  return ans;
}

function parseMolecule(formula) {
  // do your science here
  formula = formula.replace(/[\[{]/g, '(').replace(/[\]}]/g, ')');
  const arr = formula.split(/([A-Z][a-z]?)|(\d+)|(\()/g)
        .filter(s => s && !s.match(/^\s*$/));
  return parse(arr);
}
