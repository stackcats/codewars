function defaultArguments(func, params) {
  // TODO: Program me
  var args = getArgs(func);
  function foo() {
    var arr = [];
    for(var i = 0; i < args.length; i++) {
      if(i < arguments.length) {
	arr.push(arguments[i]);
      } else {
	if(typeof params[args[i]] !== 'undefined') {
	  arr.push(params[args[i]]);
	}
      }
    }
    return func.apply(null, arr);
  };
  foo.toString = function() {
    return '(' + args.join(',') + ')';
  };
  return foo;
}

function getArgs(func) {
  var funcStr = func.toString();
  funcStr = funcStr.replace(/(\/\/.*)|(\/\*.*\*\/)/g, ''); //replace comments
  var args = funcStr.substring(funcStr.indexOf('(') + 1, funcStr.indexOf(')'));
  return args.split(',').map(function(arg) {
    return arg.replace(/(^\s+)|(\s+$)/g, '');
  });
}
