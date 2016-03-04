function removeZeros(array) {
  // Sort "array" so that all elements with the value of zero are moved to the
  // end of the array, while the other elements maintain order.
  // [0, 1, 2, 0, 3] --> [1, 2, 3, 0, 0]
  // Zero elements also maintain order in which they occurred.
  // [0, "0", 1, 2, 3] --> [1, 2, 3, 0, "0"]
  
  // Do not use any temporary arrays or objects. Additionally, you're not able
  // to use any Array or Object prototype methods such as .shift(), .push(), etc
  
  // the correctly sorted array should be returned.
  console.log(array);
  var j = array.length - 1;
  while(array[j] === '0' || array[j] === 0)
    j--;
  j++;
  
  for(var i = 0; i < j; i++) {
    var n = array[i];
    if(n === 0 || n === '0') {
      var k = i + 1;
      while(k < j) {
        array[k-1] = array[k];
        k++;
      }
      array[--k] = n;
      j--;
      i--;
    }
  }

  // 当array混入字符串'0'时 结果还要保持处理前'0'和0当对应位置关系
  //[1,null,'5','0','2',0,8,6,null,false]
  //[1,null,"5","2",8,6,null,false,0,"0"] 这里'0'与0的相对位置发生的改变
  //[1,null,"5","2",8,6,null,false,"0",0] 正确结果
  for(i = array.length - 1; i > j; i--, j++) {
    var t = array[i];
    array[i] = array[j];
    array[j] = t;
  }
  return array;
}
