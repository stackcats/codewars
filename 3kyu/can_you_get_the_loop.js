function loop_size(node){
  var n = [];
  while(n.indexOf(node) == -1) {
    
    n.push(node);
    node = node.getNext();
  }
  return n.length - n.indexOf(node);
}
