function callNextMethod(...methodInfo) {
  const args = methodInfo.slice(1);
  // call the next method or throw an error
};
const toString = Object.prototype.toString;

function type(obj) {
  const s = toString.call(obj);
  return s.slice(8, s.length - 1);
}

function match(d, types) {
  const tmpl = d.split(',');
  for (let i = 0; i < tmpl.length; i++) {
    if (tmpl[i] === '*') {
      continue;
    }
    if (tmpl[i] !== types[i]) {
      return false;
    }
  }
  return true;
}

function defgeneric(name) {
  const methods = {};
  const generic = function generic(...ags) {
    // One possible implementation of the generic function
    const args = ags;
    const method = generic.findMethod(...args);
    console.log(method.toString());
    return method(...args);
  };
  
  generic.defmethod = function (discriminator, fn, combination) {
    combination = combination || 'primary';
    methods[discriminator] = fn;
    return generic;
  };
  
  generic.removeMethod = function (discriminator, combination) {
    combination = combination || 'primary';
    // XXX: remove the method
    return generic;
  };

  generic.findMethod = (...args) => {
    const dis = Object.keys(methods);
    console.log(dis);
    const types = args.map(type);
    console.log(types);
    for (const d of dis) {
      if (match(d, types)) {
        return methods[d];
      }
    }
    throw new Error();
  };

  return generic;
}

var append = defgeneric('append');
append.defmethod('Array,Array', function (a,b) { return a.concat(b); });
append.defmethod('*,Array', function (a,b) { return [a].concat(b); });
append.defmethod('Array,*', function (a,b) { return a.concat([b]); });
let res = append([1,2],3);
console.log(res);
(1,eval)("function Mammal() {} \
\
function Rhino() {} \
Rhino.prototype = new Mammal(); \
Rhino.prototype.constructor = Rhino; \
\
function Platypus() {} \
Platypus.prototype = new Mammal(); \
Platypus.prototype.constructor = Platypus;");

