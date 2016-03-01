var spiralize = function(size) {
  // insert code here
  console.log(size);
  var arr = [];
  var i, j;
  for(var i = 0; i < size; i++) {
    arr[i] = [];
    for(var j = 0; j < size; j++) {
      arr[i][j] = 0;
    }
  }
  
  var left = 0;
  var right = size;
  var top = 0;
  var bottom = size;
  i = left;
  j = top;
  var h = Math.floor(size/2);
  while(left < right && top < bottom) {
    
    while(j < right) {
      arr[i][j] = 1;
      
      //console.log(arr);
      j++;
    }
    j--;
    i++;
    
    top += 2;
    if(top >= bottom) break;
    
    while(i < bottom) {
      arr[i][j] = 1;
      
      //console.log(arr);
      i++;
    }
    i--;
    j--;
    
    right -= 2;
    if(left >= right) break;
    
    while(j >= left) {
      arr[i][j] = 1;
      
      //console.log(arr);
      j--;
    }
    j++;
    i--;
    
    bottom -= 2;
    if(top >= bottom) break;
    
    while(i >= top) {
      arr[i][j] = 1;
      
      //console.log(arr);
      i--;
    }
    i++;
    j++;

    left += 2;

  }
  if(size % 2 == 0) arr[h][h] = 1;
  return arr;
};
