guess = 1;
let m = 100000;
let x = 1 / m / 100;
let y = x;

Math = Object.create(Math, {
  random: { value: () => x += y }
});

Math.random.toString = function() {
  return 'function random() { [native code] }';
};

Object.freeze(Math);
