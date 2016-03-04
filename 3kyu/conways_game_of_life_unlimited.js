function getGeneration(cells, generations){
  
  if(generations === 0)
    return cells;
  var nextCells;
  var currCells = cells;
  var flag = false;
  while(generations > 0) {
    nextCells = nextGen(currCells);
    flag = false;
    nextCells.forEach(function(row) {
      row.forEach(function(col) {
        if(col)
          flag = true;
      });
    });
    
    if(!flag)
      return [[]];
    generations--;
    currCells = nextCells;
  }
  return crop(nextCells);
}

function nextGen(cells){
  // Uncomment next row to have an example
  cells = extend(cells);
  var rows = cells.length;
  if(rows === 0)
    return [];
  var cols = cells[0].length;
  var next = new Array(rows);
  for(var i = 0; i < rows; i++) {
    next[i] = new Array(cols);
    for(var j = 0; j < cols; j++) {
      next[i][j] = cells[i][j];
      var n = neighbours(i, j);
      if(cells[i][j]) {
        if(n < 2 || n > 3)
          next[i][j] = 0;
      } else {
        if(n === 3)
          next[i][j] = 1;
      }
    }
  }
  return next;
  function neighbours(i, j) {
    var ans = 0;
    if(cells[i-1] && cells[i-1][j])
      ans += 1;
    if(cells[i+1] && cells[i+1][j])
      ans += 1;
    if(cells[i] && cells[i][j-1])
      ans += 1;
    if(cells[i] && cells[i][j+1])
      ans += 1;
    if(cells[i-1] && cells[i-1][j-1])
      ans += 1;
    if(cells[i-1] && cells[i-1][j+1])
      ans += 1;
    if(cells[i+1] && cells[i+1][j-1])
      ans += 1;
    if(cells[i+1] && cells[i+1][j+1])
      ans += 1;
    
    return ans;
  }
}

function extend(g) {
  var rows = g.length;
  if(rows === 0)
    return g;
  var cols = g[0].length;
  var ng = new Array(rows + 2);
  var i,j;
  for(i = 0; i < rows + 2; i++) {
    ng[i] = new Array(cols+2);
    for(j = 0; j < cols+2; j++) {
      ng[i][j] = 0;
    }
  }

  for(i = 0; i < rows; i++) {
    for(j = 0; j < cols; j++) {
      ng[i+1][j+1] = g[i][j];
    }
  }
  return ng;
}

function crop(cells) {

  var r = cells.length;
  var c = cells[0].length;
  var top, bottom, left, right;
  top = r - 1;
  bottom = 0;
  left = c - 1;
  right = 0;
  var i, j, ic, jc;
  for(i = 0; i < r; i++) {
    var t = cells[i].indexOf(1);
    if(t != -1) {
      if(i < top) top = i;
      if(bottom < i) bottom = i;
      if(t < left) left = t;
      t = cells[i].lastIndexOf(1);
      if(right < t) right = t;
    }

  }

  var n = [];
  for(i = 0, ic = top ; ic <= bottom; i++, ic++) {
    n[i] = [];
    for(j = 0, jc = left; jc <= right; j++, jc++) {
      n[i][j] = cells[ic][jc];
    }
  }
  return n;
}
