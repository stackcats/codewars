/**
 * Constructor DependencyInjector
 * @param {Object} - object with dependencies
 */
var DI = function (dependency) {
  this.dependency = dependency;
};

// Should return new function with resolved dependencies
DI.prototype.inject = function (func) {
  const s = func.toString();
  const st = s.slice(s.indexOf('(') + 1 , s.indexOf(')'));
  let dps = st.split(',').map(s => s.replace(' ', '')).filter(s => s != '');
  if (dps.length === 0) {
    return () => func();
  }
  const dp = this.dependency;
  dps = dps.map(d => dp[d]);
  return () => func(...dps);
};
