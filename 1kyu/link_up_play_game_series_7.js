const ROW = 8 + 2;
const COL = 8 + 2;
const nothing = '_';

function makeArray(elem, n) {
  const arr = new Array(n);
  for (let i = 0; i < n; i++) {
    arr[i] = elem;
  }
  return arr;
}

function makeGrid(gamemap) {
  const rows = gamemap.split('\n');
  const grid = new Array(ROW);
  for (let i = 0; i < ROW; i++) {
    if (i === 0 || i === ROW - 1) {
      grid[i] = makeArray(nothing, COL);
    } else {
      grid[i] = rows[i-1].split(' ');      
      grid[i].unshift(nothing);
      grid[i].push(nothing);
    }
  }

  return grid;
}

function oneRow(grid, a, b, start, end) {
  const x1 = a[0];
  const x2 = b[0];
  if (x1 !== x2) return false;
  
  let y1 = a[1];
  let y2 = b[1];
  
  if (grid[x1][y1] !== start) return false;
  if (grid[x2][y2] !== end) return false;
  
  if (y1 > y2) {
    [y1, y2] = [y2, y1];
  }


  for (let i = y1 + 1; i < y2; i++) {
    const g = grid[x1][i];
    if (g !== nothing) return false;
  }
  return true;
}

function oneCol(grid, a, b, start, end) {
  const y1 = a[1];
  const y2 = b[1];
  if (y1 !== y2) return false;
  
  let x1 = a[0];
  let x2 = b[0];

  if (grid[x1][y1] !== start) return false;
  if (grid[x2][y2] !== end) return false;
  
  if (x1 > x2) {
    [x1, x2] = [x2, x1];
  }
  
  for (let i = x1 + 1; i < x2; i++) {
    const g = grid[i][y1];
    if (g !== nothing) return false;
  }
  return true;
}
function oneLine(grid, a, b) {
  return oneRow(grid, a, b, grid[a[0]][a[1]], grid[b[0]][b[1]]) || oneCol(grid, a, b, grid[a[0]][a[1]], grid[b[0]][b[1]]);
}

function twoLine(grid, a, b) {
  const c1 = [a[0], b[1]];
  if (oneCol(grid, a, c1, grid[a[0]][a[1]], nothing) && oneRow(grid, b, c1, grid[b[0]][b[1]], nothing))
    return true;
  const c2 = [b[0], a[1]];
  if (oneRow(grid, a, c2, grid[a[0]][a[1]], nothing) && oneCol(grid, b, c2, grid[b[0]][b[1]], nothing))
    return true;
  return false;
}
function threeLine(grid, a, b) {
  for (let i = 0; i < ROW; i++) {
    const c = [i, a[1]];
    const d = [i, b[1]];
    if (oneCol(grid, a, c, grid[a[0]][a[1]], nothing) && oneCol(grid, b, d, grid[b[0]][b[1]], nothing) && oneRow(grid, c, d, nothing, nothing))
      return true;
  }

  for (let j = 0; j < COL; j++) {
    const c = [a[0], j];
    const d = [b[0], j];
    if (oneRow(grid, a, c, grid[a[0]][a[1]], nothing) && oneRow(grid, b, d, grid[b[0]][b[1]], nothing) && oneCol(grid, c, d, nothing, nothing))
      return true;
  }

  return false;
}

function canEliminate(grid, a, b) {
  if (grid[a[0]][a[1]] !== grid[b[0]][b[1]]) return false;
  if (oneLine(grid, a, b)) return true;
  if (twoLine(grid, a, b)) return true;
  if (threeLine(grid, a, b)) return true;
  return false;
}

function linkUp(gamemap) {
  const stack = [];
  const grid = makeGrid(gamemap);
  let queue = [];
  let backStep = 1;
  for (let i = 1; i < ROW - 1; i++) {
    for (let j = 1; j < COL - 1; j++) {
      queue.push([i, j]);
    }
  }
  
  while (queue.length > 0) {
    let flag = true;
    LOOP:
    for (let i = queue.length - 1; i >= 0; i--) {
      for (let j = i - 1; j >= 0; j--) {        
        const a = queue[i];
        const b = queue[j];
        if (canEliminate(grid, a, b)) {          
          flag = false;
          queue.splice(i, 1);
          queue.splice(j, 1);
          const card = grid[a[0]][a[1]];
          grid[a[0]][a[1]] = nothing;
          grid[b[0]][b[1]] = nothing;
          
          stack.push({
            a: [...a],
            b: [...b],
            card
          });
          
          break LOOP;
        }
      }
    }
    if (flag) {
      backStep++;
      for (let i = 0; i < backStep; i++) {
        if (stack.length === 0) break;
        const { a, b, card } = stack.pop();
        queue.unshift(a);
        queue.unshift(b);
        grid[a[0]][a[1]] = card;
        grid[b[0]][b[1]] = card;
      }
    }
  }
  
  return stack.map(a => [a.a.map(x => x - 1), a.b.map(x => x - 1)]);
}
