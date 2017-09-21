function isShip(field, i, j, dt) {
  if (dt[[i,j]] !== undefined) return 0;
  if (field[i][j] === 0) return 0;
  const ROW = field.length;
  const COL = field[0].length;
  let len = 0;
  let x = i;
  while (field[x][j] && x < ROW) {
    len++;
    x++;
  }
  if (len > 1) {
    if (i - 1 >= 0 && j + 1 < COL && field[i-1][j+1] !== 0) return -1;
    while (i < x) {
      if (j + 1 < COL && field[i][j+1] !== 0) return -1;
      dt[[i,j]] = 1;
      i++;
    }
    if (i < ROW && j + 1 < COL && field[i][j+1] !== 0) return -1;
    return len;
  }
  
  len = 0;
  let y = j;
  while (field[i][y] && y < COL) {
    len++;
    y++;
  }
  if (j - 1 >= 0 && i + 1 < ROW && field[i+1][j-1] !== 0) return -1;
  while (j < y) {
    if (i + 1 < ROW && field[i+1][j] !== 0) return -1;
    dt[[i,j]] = 1;
    j++;
  }
  if (i+1 && field[i+1][j] !== 0) return -1;
  return len;
}

function validateBattlefield(field) {
  console.log(field);
  const ROW = field.length;
  const COL = field[0].length;
  const ships = {
    4: 1,
    3: 2,
    2: 3,
    1: 4
  };
  const dt = {};
  for (let i = 0; i < ROW; i++) {
    for (let j = 0; j < COL; j++) {
      const len = isShip(field, i, j, dt);
      if (len < 0) return false;
      if (len !== 0) {
        if (ships[len] === undefined) {
          return false;
        }
        ships[len] -= 1;
        if (ships[len] < 0) {
          return false;
        }
      }
    }
  }
  const k = Object.keys(ships);
  for (const s of k) {
    if (ships[s] !== 0) return false;
  }
  return true;
}
