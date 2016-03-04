function solve(map, miner, exit) {
  // TODO
  var rows = map.length;
  var cols = map[0].length;
  var mmap = new Array(rows);
  for(var i = 0; i < rows; i++) {
    mmap[i] = new Array(cols);
    for(var j = 0; j < cols; j++) {
      mmap[i][j] = map[i][j];
    }

  }
  //console.log(mmap);
  var arr = [miner];
  dfs(mmap, miner, exit, arr);
  //console.log(arr);
  var ans = [];
  for(var i = 0; i < arr.length - 1; i++) {
    var a = arr[i];
    var b = arr[i+1];
    if(a.x + 1 == b.x) {
      ans.push('right');
    } else if(a.y + 1 == b.y) {
      ans.push('down');
    } else if(a.x - 1 == b.x) {
      ans.push('left');
    } else {
      ans.push('up');
    }
  }
  return ans;
}

function dfs(map, start, end, ans) {
  if(start.x == end.x && start.y == end.y) {
    return true;
  }
  var neighbors = getNeighbors(map, start.x, start.y);
  console.log(neighbors);
  for(var i = 0; i < neighbors.length; i++) {
    ans.push(neighbors[i]);
    var n = dfs(map, neighbors[i], end, ans);
    if(n) {
      return n;
    }
    ans.pop(neighbors[i]);
  }

  return false;
}

function getNeighbors(map, i, j) {
  var ans = [];
  if(map[i-1] && map[i-1][j]) {
    ans.push({x:i-1, y:j});
    map[i-1][j] = 0;
  }
  
  if(map[i] && map[i][j-1]) {
    ans.push({x:i, y:j-1});
    map[i][j-1] = 0;
  }
  
  if(map[i+1] && map[i+1][j]) {
    ans.push({x:i+1, y:j});
    map[i+1][j] = 0;
  }
  
  if(map[i] && map[i][j+1]) {
    ans.push({x:i, y:j+1});
    map[i][j+1] = 0;
  }
  
  return ans;
}
