function buildFun(n){

  var res = [];

  for (var i = 0; i< n; i++){
    res.push((function(x){
      //如果不用(function(){})() 封装下 根据js特性i永远等于for循环后的最终值
      return function() { return x;};
    })(i));
  }
  return res;
}


