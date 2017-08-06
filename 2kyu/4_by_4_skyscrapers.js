const ROW = 4;
const COL = 4;
const MAX = ROW * COL;

function scanLeft(arr, ct) {
  if (ct === 0) return true;
  let sum = 1;
  for (let i = 0, j = i + 1; j < COL; j += 1) {
    if (arr[i] < arr[j]) {
      sum += 1;
      i = j;
    }
  }
  return sum === ct;
}

function scanRight(arr, ct) {
  if (ct === 0) return true;
  let sum = 1;
  for (let i = COL - 1, j = i - 1; j >= 0; j -= 1) {
    if (arr[i] < arr[j]) {
      sum += 1;
      i = j;
    }
  }
  return sum === ct;
}

function transpos(arr) {
  const tran = [];
  for (let i = 0; i < arr.length; i += 1) {
    for (let j = 0; j < arr[i].length; j += 1) {
      if (tran[j] === undefined) tran[j] = [];
      tran[j][i] = arr[i][j];
    }
  }
  return tran;
}

function skyscraper(arr, rows, cols) {
  for (let i = 0; i < ROW; i += 1) {
    let ok = scanLeft(arr[i], rows[i][0]);
    if (!ok) return false;
    ok = scanRight(arr[i], rows[i][1]);
    if (!ok) return false;
  }
  const tran = transpos(arr);
  for (let i = 0; i < ROW; i += 1) {
    let ok = scanLeft(tran[i], cols[i][0]);
    if (!ok) return false;
    ok = scanRight(tran[i], cols[i][1]);
    if (!ok) return false;
  }
  return true;
}

function check(arr, x, y) {
  for (let j = 0; j < y; j += 1) {
    if (arr[x][y] === arr[x][j]) return false;
  }

  for (let i = 0; i < x; i += 1) {
    if (arr[x][y] === arr[i][y]) return false;
  }

  return true;
}

function dfs(arr, n, x, rows, cols) {
  if (n >= MAX) {
    if (skyscraper(arr, rows, cols)) {
      return arr;
    }
    return null;
  }

  const row = Math.floor(n / COL);
  const col = n % ROW;
  arr[row][col] = x;
  if (!check(arr, row, col)) return null;

  for (let i = 1; i <= ROW; i += 1) {
    const ok = dfs(arr, n + 1, i, rows, cols);
    if (ok) return ok;
  }
  return null;
}
function solvePuzzle(clues) {
  const arr = [];
   for (let i = 0; i < ROW; i += 1) {
     arr[i] = [];
     for (let j = 0; j < COL; j += 1) {
       arr[i][j] = 0;
     }
   }

  const rows = [
    [clues[15], clues[4]],
    [clues[14], clues[5]],
    [clues[13], clues[6]],
    [clues[12], clues[7]]
  ];

  const cols = [
    [clues[0], clues[11]],
    [clues[1], clues[10]],
    [clues[2], clues[9]],
    [clues[3], clues[8]]
  ];

  // console.log(skyscraper(arr, rows, cols));
  for (let i = 1; i <= ROW; i += 1) {
    const ok = dfs(arr, 0, i, rows, cols);
    if (ok) return ok;
  }
}
