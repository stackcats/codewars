function outerEdgesOf(arr){
  // returns an array with the same dimensions as arr.
  // where the outer edges of the features of arr are highlighted (1)
  const row = arr.length;
  const col = arr[0].length;
  const ans = new Array(row);
  for (let i = 0; i < row; i++) {
    ans[i] = new Array(col);
    for (let j = 0; j < col; j++) {
      const n = arr[i][j];
      if (n === 1) {
        ans[i][j] = 0;
      } else if (check(arr, i, j)) {
        ans[i][j] = 1;
      } else {
        ans[i][j] = 0;
      }
    }
  }
  return ans;
}

function innerEdgesOf(arr){
  // returns an array with the same dimensions as arr.
  // where the inner edges of the features of arr are highlighted (1)
  const row = arr.length;
  const col = arr[0].length;
  const ans = new Array(row);
  for (let i = 0; i < row; i++) {
    ans[i] = new Array(col);
    for (let j = 0; j < col; j++) {
      const n = arr[i][j];
      if (n === 1 && check(arr, i, j) !== 8) {
        ans[i][j] = 1;
      } else {
        ans[i][j] = 0;
      }
    }
  }
  return ans;
}

function grow(arr){
  // returns an array with the same dimensions as arr.
  // where the the features have grown
  const row = arr.length;
  const col = arr[0].length;
  const ans = new Array(row);
  for (let i = 0; i < row; i++) {
    ans[i] = new Array(col);
    for (let j = 0; j < col; j++) {
      const n = arr[i][j];
      if (n === 1) {
        ans[i][j] = 1;
      } else if (check(arr, i, j)) {
        ans[i][j] = 1;
      } else {
        ans[i][j] = 0;
      }
    }
  }
  return ans;
}

function shrink(arr){
  // returns an array with the same dimensions as arr.
  // where the the features have shrunk
  const row = arr.length;
  const col = arr[0].length;
  const ans = new Array(row);
  for (let i = 0; i < row; i++) {
    ans[i] = new Array(col);
    for (let j = 0; j < col; j++) {
      const n = arr[i][j];
      if (n === 1 && check(arr, i, j) === 8) {
        ans[i][j] = 1;
      } else {
        ans[i][j] = 0;
      }
    }
  }
  return ans;
}

function check(arr, i, j) {
  // console.log(i, j);
  const row = arr.length;
  const col = arr[0].length;
  let ans = 0;
  if (i - 1 >= 0 && arr[i - 1][j]) {
    ans++;
  }
  if (i - 1 >= 0 && j + 1 < col && arr[i - 1][j + 1]) {
    ans++;
  }
  if (j + 1 < col && arr[i][j + 1]) {
    ans++;
  }
  if (i + 1 < row && j + 1 < col && arr[i + 1][j + 1]) {
    ans++;
  }
  if (i + 1 < row && arr[i + 1][j]) {
    ans++;
  }
  if (i + 1 < row && j - 1 >= 0 && arr[i + 1][j - 1]) {
    ans++;
  }
  if (j - 1 >= 0 && arr[i][j - 1]) {
    ans++;
  }
  if (i - 1 >= 0 && j - 1 >= 0 && arr[i - 1][j - 1]) {
    ans++;
  }
  return ans;
}
