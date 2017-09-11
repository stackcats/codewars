function pathFinder(maze){
  const rows = maze.split('\n');
  const grid = rows.map(r => r.split(''));
  const N = grid.length;
  const queue = [{ i: 0, j: 0 }];
  const opt = [];
  for (let i = 0; i < N; i++) {
    opt[i] = [];
    for (let j = 0; j < N; j++) {
      opt[i][j] = 0;
    }
  }
  const dirs = [[-1, 0], [0, -1], [0, 1], [1, 0]];
  while (queue.length > 0) {
    const { i, j } = queue.shift();
    if (i === N - 1 && j === N - 1) return true;
    for (const d of dirs) {
      const x = i + d[0];
      const y = j + d[1];
      if (x >= 0 && x < N && y >= 0 && y < N &&  grid[x][y] === '.' && opt[x][y] === 0) {
        queue.push({ i: x, j: y });
        opt[x][y] = 1;
      }
    }
  }
  return false;
}
