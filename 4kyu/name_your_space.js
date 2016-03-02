function namespace(root, path, value){
  if(typeof value == 'undefined') {
    var paths = path.split('.');
    var val = root;
    for(var i = 0; i < paths.length; i++) {
      val = val[paths[i]];
      if(typeof val === 'undefined')
        return undefined;
    }
    return val;
  } else {
    paths = path.split('.');
    val = value;
    for(i = paths.length - 1; i > 0; i--) {
      var name = {};
      name[paths[i]] = val;
      val = name;
    }
    root[paths[0]] = val;
  }
}
