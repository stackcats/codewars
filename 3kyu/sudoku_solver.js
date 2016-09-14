function check(arr, i, j, n) {
  for (let x = 0; x < 9; x++) {
    if (arr[i][x] === n || arr[x][j] === n) return false;
  }

  const cellX = i - i % 3;
  const cellY = j - j % 3;
  for (let x = cellX; x < cellX + 3; x++) {
    for (let y = cellY; y < cellY + 3; y++) {
      if (arr[x][y] === n) return false;
    }
  }
  return true;
}

function dfs(arr, x, blank, ans) {
  if (x === blank.length) {
    ans.push(JSON.stringify(arr));
    return;
  }

  for (let n = 1; n < 10; n++) {
    const { i, j } = blank[x];
    if (check(arr, i, j, n)) {
      arr[i][j] = n;
      dfs(arr, x + 1, blank, ans);
      arr[i][j] = 0;
    }
  }
}

function sudoku(puzzle) {
  const ans = [];
  const arr = [];
  for (let i = 0; i < 9; i++) {
    for (let j = 0; j < 9; j++) {
      if (puzzle[i][j] === 0) {
        arr.push({ i, j });
      }
    }
  }
  dfs(puzzle, 0, arr, ans);
  return JSON.parse(ans[0]);
}
