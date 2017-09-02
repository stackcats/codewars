function unflatten(arr, depth, dir = true) {
  if (depth <= 0) return arr;
  const ans = [];
  if (dir) {
    let i = 0;
    while (i < arr.length) {
      if (Array.isArray(arr[i])) {
        ans.push(unflatten(arr[i], depth));
        i++;
      } else if (arr[i] < 3) {
        ans.push(arr[i]);
        i++;
      } else {
        const rem = arr[i] % (arr.length - i);
        if (rem < 3) {
          ans.push(arr[i]);
          i++;
        } else {
          ans.push(arr.slice(i, i + rem));
          i += rem;
        }        
      }
    }
  } else {
    let i = arr.length - 1;
    while (i >= 0) {
      if (Array.isArray(arr[i])) {        
        ans.unshift(unflatten(arr[i], depth, false));
        i--;
      } else if (arr[i] < 3) {
        ans.unshift(arr[i]);
        i--;
      } else {
        const rem = arr[i] % (i + 1);
        if (rem < 3) {
          ans.unshift(arr[i]);
          i--;
        } else {
          ans.unshift(arr.slice(i - rem + 1, i+1));
          i -= rem;
        }        
      }
    }
  } 
  return unflatten(ans, depth - 1, dir = false);
}
