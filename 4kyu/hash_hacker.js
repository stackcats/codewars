function crackHash(h, y) {
  // Find any integer x >= 0 such that h(x) = y
  // h:R->R is a non-decreasing (not necessarily continuous) function over the Reals
  // y is not necessarily an integer
  // at least one valid value x is guaranteed to exists
  // Remember if you call h more than 10+2*ceil(log_2(x)) times you fail

  var x = test(1, y);
  return x;
  function test(x, y) {
    var t = h(x);
    if(t == y)
      return x;
    else {
      test(improve(x, y, t) , y);
    }
  }

  function improve(x, y, t) {
    return Math.floor(x - t/dh(x, t));
  }

  function dh(x, t) {
    var dx = 0.001;
    return (h(x+dx) - t)/dx;
  }
}	//140737488355328


