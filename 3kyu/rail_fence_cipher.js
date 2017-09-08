function helper(string, numberRails) {
  const ans = new Array(numberRails);
  for (let i = 0; i < ans.length; i++) {
    ans[i] = '';
  }
  
  let i = 0;
  let di = 1;
  for (const ch of string) {
    ans[i] += ch;
    i += di;
    if (i === numberRails - 1) {
      di = -1;
    } else if (i === 0) {
      di = 1;
    }
  }
  return ans;
}

function encodeRailFenceCipher(string, numberRails) {
  return helper(string, numberRails).join('');
}

function decodeRailFenceCipher(string, numberRails) {
  const all = string.length;
  const arr = helper(string, numberRails).map(a => a.length);
  for (let i = 0; i < arr.length; i++) {
    const len = arr[i];
    arr[i] = string.slice(0, len).split('');
    string = string.slice(len);
  }
  let ans = '';
  let i = 0;
  let di = 1;
  while (ans.length < all) {    
    ans += arr[i].shift();
    i += di;
    if (i === numberRails - 1) {
      di = -1;
    } else if (i === 0) {
      di = 1;
    }
  }
  return ans;
}
