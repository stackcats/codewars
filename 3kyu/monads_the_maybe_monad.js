/////////////////////////////////////////////////////////////////
function Maybe () {
  Object.freeze(this);
};

/////////////////////////////////////////////////////////////////
function Just (x) {
  this.toString = function () { return "Just " + x.toString(); };
  this.just = x;
  Object.freeze(this);
};
Just.prototype = new Maybe();
Just.prototype.constructor = Just;

/////////////////////////////////////////////////////////////////
function Nothing () {
  this.toString = function () { return "Nothing"; };
  Object.freeze(this);
};
Nothing.prototype = new Maybe();
Nothing.prototype.constructor = Nothing;

/////////////////////////////////////////////////////////////////
Maybe.unit = function (x) {
  return new Just(x);
};

Maybe.bind = function (f) {
  return (m) => {
    if (m instanceof Maybe) 
      return m.just === undefined ? new Nothing() : f(m.just);
    else
      throw 'error';
  };
};

Maybe.lift = function (f) {
  return (x) => {
    try {
      return Maybe.unit(f(x));
    } catch (err) {
      return new Nothing();
    }
  };
};

Maybe.do = function(m) {
  var fns = Array.prototype.slice.call(arguments, 1);
  for (const f of fns) {
    m = Maybe.bind(f)(m);
  }
  return m;
};
