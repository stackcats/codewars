function List() {}

function EmptyList() {}
EmptyList.prototype = new List();
EmptyList.prototype.constructor = EmptyList;

EmptyList.prototype.toString = function() {
  /* implement this */
  return '()';
};

EmptyList.prototype.isEmpty = function() {
  /* implement this */
  return true;
};

EmptyList.prototype.length = function() {
  /* implement this */
  return 0;
};

EmptyList.prototype.push = function(x) {
  var listNode = new ListNode(x, this);
  return listNode;
};

EmptyList.prototype.remove = function(x) { 
  return this;
};

EmptyList.prototype.append = function(xs) { 
  return xs;
};

function ListNode(value, next) {
  this.value = value;
  this.next = next;
}
ListNode.prototype = new List();
ListNode.prototype.constructor = ListNode;
ListNode.prototype.isEmpty = function() { 
  return false;
};

ListNode.prototype.toString = function() { 
  var str = '(';
  var node = this;
  while(!node.isEmpty()){
    str += node.value + ' ';
    node = node.next;
  }
  str = str.substr(0, str.length-1);
  return str + ')';
};

ListNode.prototype.head = function() { 
  if(!this.isEmpty()) {
    return this.value;
  }
};

ListNode.prototype.tail = function() {
  if(!this.isEmpty()) {
    return this.next;
  }
};

ListNode.prototype.length = function() { 
  var len = 0;
  var node = this;
  while(!node.isEmpty()) {
    len++;
    node = node.next;
  }
  return len;
};
ListNode.prototype.push = function(x) {
  var listNode = new ListNode(x, this);
  return listNode;
};

ListNode.prototype.remove = function(x) { 
  var ct = 0;
  var last = 0;
  var node = this;
  while(!node.isEmpty()) {
    if(node.value == x)
      last = ct + 1;
    node = node.next;
    ct++;
  }
  var mt = new EmptyList();
  node = this;
  while(last > 0){
    if(node.value != x)
      mt = mt.push(node.value);
    node = node.next;
    last--;
  }
  mt = mt.append(node);
  
  return mt;
};
ListNode.prototype.append = function(xs) { 
  var nodes = [];
  var curr = this;
  while(!curr.isEmpty()) {
    nodes.push(curr.value);
    curr = curr.next;
  }
  
  var mt = xs;
  while(nodes.length > 0) {
    mt = mt.push(nodes.pop());
  }

  return mt;
};
