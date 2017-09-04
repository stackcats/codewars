Cons.fromArray = function(arr) {
  let list;
  for (let i = arr.length - 1; i >= 0; i--) {
    list = new Cons(arr[i], list);
  }
	return list;
};

function filter(list, predicate){
  if (!list) {
    return null;
  }
  if (predicate(list.head)) {
    return new Cons(list.head, filter(list.tail, predicate));
  }
  return filter(list.tail, predicate);
}

function map(list, mapper){
  if (!list) {
    return null;
  }
  return new Cons(mapper(list.head), map(list.tail, mapper));
}

Cons.prototype.filter = function(predicate){ return filter(this,predicate); };
Cons.prototype.map = function(mapper){ return map(this, mapper); };
