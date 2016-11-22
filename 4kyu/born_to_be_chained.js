function chain(fns) {
  const obj = {};
  const chains = [];
  obj.execute = _ => {
    let pre = undefined;
    for (const c of chains) {
      if (pre === undefined) {
        pre = c.fn(...c.args);
      } else {
        pre = c.fn(pre, ...c.args);
      }
    }
    return pre;
  };

  Object.keys(fns).forEach(f => {
    obj[f] = (...args) => {
      chains.push({
        fn: fns[f],
        args
      });
      return obj;
    };
  });
  return obj;
}


function sum(x, y) {
  return x + y;
}

function double(x) {
  return sum(x, x);
}

function minus (x, y) {
  return x - y;
}

function addOne(x) {
  return sum(x, 1);
}

var c = chain({sum: sum, minus: minus, double: double, addOne: addOne});

var c1 = c.sum(4, 5);

var c2 = c1.sum(5);
console.log(c1.execute());
// console.log(c2.sum(3).execute());
