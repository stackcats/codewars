//直接修改于3kyu/make_a_spriral.js
var snail = function(array) {
  // enjoy
  var ans = []; 
  var left = 0;
  var right = array.length;
  var top = 0;
  var bottom = array[0].length; // N x N
  i = left;
  j = top;

  while(left < right && top < bottom) {
    
    while(j < right) {
      ans.push(array[i][j])
      j++;
    }
    j--;
    i++;
    
    top += 1;
    if(top >= bottom) break;
    
    while(i < bottom) {
      ans.push(array[i][j])
      
      //console.log(arr);
      i++;
    }
    i--;
    j--;
    
    right -= 1;
    if(left >= right) break;
    
    while(j >= left) {
      ans.push(array[i][j]);

      j--;
    }
    j++;
    i--;
    
    bottom -= 1;
    if(top >= bottom) break;
    
    while(i >= top) {
      ans.push(array[i][j]);
      
      //console.log(arr);
      i--;
    }
    i++;
    j++;

    left += 1;

  }
  //if(size % 2 == 0) arr[h][h] = 1;
  return ans;

}
