function BinaryTree() {};

function BinaryTreeNode(value, left, right) {
  this.value = value;
  this.left = left;
  this.right = right;
  Object.freeze(this);
}
BinaryTreeNode.prototype = new BinaryTree();
BinaryTreeNode.prototype.constructor = BinaryTreeNode;

BinaryTreeNode.prototype.isEmpty = function() { return false; };

BinaryTreeNode.prototype.depth = function() { 
  return 1 + Math.max(this.left.depth(), this.right.depth());  
};

BinaryTreeNode.prototype.count = function() { 
  return 1 + this.left.count() + this.right.count()
};

BinaryTreeNode.prototype.inorder = function(fn) {
  this.left.inorder(fn);
  fn(this.value);
  this.right.inorder(fn);
};

BinaryTreeNode.prototype.preorder = function(fn) { 
  fn(this.value);
  this.left.preorder(fn);
  this.right.preorder(fn);
};

BinaryTreeNode.prototype.postorder = function(fn) {
  this.left.postorder(fn);
  this.right.postorder(fn);
  fn(this.value);
};

BinaryTreeNode.prototype.contains = function(x) {
  if(x == this.value)
    return true;
  else if(x < this.value)
    return this.left.contains(x);
  else
    return this.right.contains(x);
};

BinaryTreeNode.prototype.insert = function(x) { 
  if(x < this.value) {
    return new BinaryTreeNode(this.value, this.left.insert(x), this.right);
  } else {
    return new BinaryTreeNode(this.value, this.left, this.right.insert(x));
  };
};
BinaryTreeNode.prototype.remove = function(x) { 
  if(!this.contains(x))
    return this

  if(x == this.value) {
    if(this.left.isEmpty())
      return this.right;
    if(this.right.isEmpty())
      return this.left;
    var vals = [];
    this.left.inorder(function(x) {
      vals.push(x);
    });
    var v = vals.pop();
    var node = new BinaryTreeNode(v, new EmptyBinaryTree(), this.right);
    vals.forEach(function(v) {
      node = node.insert(v);
    });
    return node
  } else if(x < this.value) {
    return new BinaryTreeNode(this.value, this.left.remove(x), this.right);
  } else {
    return new BinaryTreeNode(this.value, this.left, this.right.remove(x));
  }
};

////////////////////////////////////////////////////////////////////////
function EmptyBinaryTree() { Object.freeze(this); }
EmptyBinaryTree.prototype = new BinaryTree();
EmptyBinaryTree.prototype.constructor = EmptyBinaryTree;

EmptyBinaryTree.prototype.isEmpty = function() { return true; };
EmptyBinaryTree.prototype.depth = function() { return 0; };
EmptyBinaryTree.prototype.count = function() { return 0; };

EmptyBinaryTree.prototype.inorder = function(fn) { return; };
EmptyBinaryTree.prototype.preorder = function(fn) { return; };
EmptyBinaryTree.prototype.postorder = function(fn) { return; };
EmptyBinaryTree.prototype.contains = function(x) { return false; };
EmptyBinaryTree.prototype.insert = function(x) {
  return new BinaryTreeNode(x, this, new EmptyBinaryTree());
};
EmptyBinaryTree.prototype.remove = function(x) { return this; };
