function func(x) { return x; }

function zero(f) { f = f || func; return f(0); }
function one(f) { f = f || func; return f(1); }
function two(f) { f = f || func; return f(2); }
function three(f) { f = f || func; return f(3); }
function four(f) { f = f || func; return f(4); }
function five(f) { f = f || func; return f(5); }
function six(f) { f = f || func; return f(6); }
function seven(f) { f = f || func; return f(7); }
function eight(f) { f = f || func; return f(8); }
function nine(f) { f = f || func; return f(9); }

function plus(n) { return x => x + n; }
function minus(n) { return x => x - n; }
function times(n) { return x => x * n; }
function dividedBy(n) { return x => x / n; }
