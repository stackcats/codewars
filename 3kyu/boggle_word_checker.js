function neighbors(board, dt, i, j) {
  const arr = [];

  if (board[i-1] && board[i-1][j-1] && dt[[i-1, j-1]] === undefined) {
    arr.push({ i: i - 1, j : j - 1 });
  }
  if (board[i-1] && dt[[i-1, j]] === undefined) {
    arr.push({ i: i - 1, j });
  }
  if (board[i-1] && board[i-1][j+1] && dt[[i-1, j+1]] === undefined) {
    arr.push({ i: i - 1, j : j + 1 });
  }
  if (board[i][j+1] && dt[[i, j+1]] === undefined) {
    arr.push({ i, j : j + 1 });
  }
  if (board[i+1] && board[i+1][j+1] && dt[[i+1, j+1]] === undefined) {
    arr.push({ i: i + 1, j : j + 1 });
  }
  if (board[i+1] && dt[[i+1, j]] === undefined) {
    arr.push({ i: i + 1, j });
  }
  if (board[i+1] && board[i+1][j-1] && dt[[i+1, j-1]] === undefined) {
    arr.push({ i: i + 1, j : j - 1 });
  }
  if (board[i][j-1] && dt[[i, j-1]] === undefined) {
    arr.push({ i, j : j - 1 });
  }
  
  return arr;
}

function dfs(board, opt, x, y, word) {
  if (board[x][y] !== word[0]) return false;
  if (word.length === 1) return true;

  const arr = neighbors(board, opt, x, y);
  for (const { i, j } of arr) {
    opt[[i, j]] = true;
    const res = dfs(board, opt, i, j, word.slice(1));
    if (res) return true;
    opt[[i, j]] = undefined;
  }
  return false;
}

function checkWord( board, word ) {
  const ROW = board.length;
  const COL = board[0].length;
  
  for (let i = 0; i < ROW; i++) {
    for (let j = 0; j < COL; j++) {
      const dt = {};
      const res = dfs(board, dt, i, j , word);
      if (res) return true;
    }
  }
  return false;
}
