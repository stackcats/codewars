var N = 9;
function validSolution(board){
  //TODO
  return checkRow(board) &&
    checkCol(board) &&
    checkCell(board);
}

function check(board, i, j) {
  var obj = [0,0,0,0,0,0,0,0,0,0];
  for(var m = 0; m < 3; m++) {
    for(var n = 0; n < 3; n++) {
      var c = board[m+i][n+j];
      if(obj[c])
        return false;
      obj[c] = 1;
    }
  }
  return true;
}
function checkCell(board) {
  for(var i = 0; i < 3; i++) {
    for(var j = 0; j < 3; j++) {
      var ret = check(board, i*3, j*3);
      if(!ret)
        return false;
    }
  }
  return true;
}

function checkCol(board) {
  for(var j = 0; j < N; j++) {
    var obj = [0,0,0,0,0,0,0,0,0,0];
    for(var i = 0; i < N; i++) {
      if(obj[board[i][j]])
        return false;
      obj[board[i][j]] = 1;
    }
  }
  return true;
}

function checkRow(board) {
  for(var i = 0; i < N; i++) {
    var obj = [0,0,0,0,0,0,0,0,0,0];
    for(var j = 0; j < N; j++) {
      if(obj[board[i][j]])
        return false;
      obj[board[i][j]] = 1;
    }
  }
  return true;
}
