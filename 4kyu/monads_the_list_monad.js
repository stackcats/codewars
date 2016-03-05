function canReach(from, to, movements) {
  var a = knightEngine(from, movements);
  for(var i = 0; i < a.length; i++) {
    if(to[0] == a[i][0] && to[1] == a[i][1])
      return true;
  }
  return false;
}

function moveKnight(from) {
  var ans = [];
  var c = from[0];
  var r = from[1];
  var arr = [[1,2], [2,1], [2,-1], [1,-2], [-1,-2], [-2,-1], [-2,1],[-1,2]];
  arr.forEach(function(m) {
    if(check(c+m[0], r+m[1]))
      ans.push([c+m[0], r+m[1]]);
  });
  return ans;
}

function check(a, b) {
  return a > 0 && a < 9 && b > 0 && b < 9;
}

function moveKnightRandom(from) {
  var pos = moveKnight(from);
  return pos[Math.floor(Math.random() * pos.length)];
}

function compose() {
  var args = [];
  for(var i = 0; i < arguments.length; i++) {
    args.unshift(arguments[i]);
  }
  return function() {
    var ag = []
    for(var i = 0; i < arguments.length; i++)
      ag.push(arguments[i])
    for(var i = 0; i < args.length; i++) {
      var f = args[i];
      ag = [f.apply(null, ag)];
    }
    return ag[0];
  }  
}

function bind(func) {
  return function(list) {
    return list.reduce(function(a, b) {
      var ret =  func(b);
      if(ret instanceof Array) {
        Array.prototype.push.apply(a, ret);
        return a;
      } else {
        throw new Error('The returned value is not a list!');
      }
    }, []);
  }
}

function unit() {
  var ans = [];
  for(var i = 0; i < arguments.length; i++)
    ans.push(arguments[i]);
  return ans;
}

function knightEngine(from, movements) {
  //if(movements == 0) return from;
  var func = function(args) {return args;};
  while(movements-- > 0) {
    func = compose(func, bind(moveKnight));
  }
  return compose(func, unit)(from);
}
