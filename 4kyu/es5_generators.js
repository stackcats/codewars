function generator(sequencer) {
  
  var ct = 0
  var last = [];
  var args = [];
  for(var i = 1; i < arguments.length; i++) {
    args.push(arguments[i]);
  }
  return {
    next: function() {
      return sequencer.apply(null, args).call(null, ct++, last);
    }
  };
}

function dummySeq() {
  return function() {
    return "dummy";
  };
}

function factorialSeq() {
  return function(n, last) {
    if(n == 0) {
      last[0] = 1;
      return 1;
    }
    else {
      last[0] *= n;
      return last[0];
    }
  };
}

function fibonacciSeq() {
  return function(n, last) {
    if(n == 1 || n == 0) {
      last[0] = 1;
      last[1] = 1;
      return 1;
    } else {
      var ret = last[0] + last[1];
      last[0] = last[1];
      last[1] = ret;
      return ret;
    }
  };
}

function rangeSeq(start, step) {
  return function(n, last) {
    if(n == 0) {
      last[0] = start;
      return start;
    } else {
      last[0] += step;
      return last[0];
    }
  };
}

function primeSeq() {
  return function(n, last) {
    if(n == 0) {
      last[0] = 2;
      return 2;
    } else {
      var p = nextPrime(last);
      last.push(p);
      return p;
    }
  }
}

function nextPrime(lst) {
  var il = lst.length;
  var n = lst[il-1] + 1;
  while(!isPrime(n, lst)) {
    n++;
  }
  return n;
}

function isPrime(n, lst) {
  for(var i = 0; i < lst.length; i++) {
    if(n % lst[i] == 0)
      return false;
  }
  return true;
}
function partialSumSeq() {
  var args = arguments;
  return function(n, last) {
    if(n >= args.length) {
      throw new Error('End of sequence error expected');
    } else if(n == 0) {
      last[0] = args[0];
      return last[0];
    } else {
      last[0] += args[n];
      return last[0];
    }
  };
}
