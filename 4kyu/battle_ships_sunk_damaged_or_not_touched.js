function damagedOrSunk (board, attacks){
  const ans = {
    sunk: 0,
    damaged: 0,
    notTouched: 0,
    points: 0
  };
  
  const boats = {};
  const ROW = board.length;
  const COL = board[0].length;
  for (let i = 0; i < ROW; i++) {
    for (let j = 0; j < COL; j++) {
      const n = board[i][j];
      if (n !== 0 && boats[n] === undefined) {
          boats[n] = { pos: [], len: 0 };
          let x = i;
          while (x < ROW && board[x][j] === n) {
            boats[n].pos.push([x, j]);
            x++;
          }
          
          let y = j + 1;
          while (y < COL && board[i][y] === n) {
            boats[n].pos.push([i, y]);
            y++;
          }
          boats[n].len = boats[n].pos.length;
      }
    }
  }
  
  for (const [x, y] of attacks) {
    const j = x - 1;
    const i = ROW - y;
    const arr = Object.keys(boats);
    for (let key of arr) {
      const pos = boats[key].pos;
      for (let k = 0; k < pos.length; k++) {
        const p = pos[k];
        if (p[0] == i && p[1] == j) {
          boats[key].pos.splice(k, 1);
          if (boats[key].pos.length === 0) {
            delete boats[key];
            ans.sunk++;            
          }
          break;
        }        
      }
    }
  }
  
  Object.keys(boats).forEach(k => {
    const boat = boats[k];
    if (boat.pos.length !== boat.len) {
      ans.damaged++;
    } else {
      ans.notTouched++;
    }
  });
  
  ans.points = ans.sunk + ans.damaged * 0.5 - ans.notTouched;
  return ans;
}
