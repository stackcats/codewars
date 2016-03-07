// 修改于4kyu/sudoku_solution_validator.js
var Sudoku = function(data) 
{
  //   Private methods
  // -------------------------
  var N = data.length;
  
  function validSolution(board){
    return checkRow(board) &&
      checkCol(board) &&
      checkCell(board);
  }

  function checkCell(board) {
    var len = Math.sqrt(N);
    for(var i = 0; i < len; i++) {
      for(var j = 0; j < len; j++) {
	var ret = check(board, i*len, j*len);
	if(!ret)
          return false;
      }
    }
    return true;
  }

  function check(board, i, j) {
    var obj = new Array(N);
    var len = Math.sqrt(N);
    for(var m = 0; m < len; m++) {
      for(var n = 0; n < len; n++) {
	var c = board[m+i][n+j];
	if(obj[c])
          return false;
	obj[c] = 1;
      }
    }
    return true;
  }
  
  function checkRow(board) {
    for(var i = 0; i < N; i++) {
      var obj = new Array(N);
      for(var j = 0; j < N; j++) {
	if(obj[board[i][j]])
          return false;
	obj[board[i][j]] = 1;
      }
    }
    return true;
  }
  function checkCol(board) {
    for(var j = 0; j < N; j++) {
      var obj = new Array(N);
      for(var i = 0; i < N; i++) {
	if(obj[board[i][j]])
          return false;
	obj[board[i][j]] = 1;
      }
    }
    return true;
  }
  //   Public methods
  // -------------------------
  return {
    isValid: function() {
      // YOUR SOLUTION
      if(data.length == 1)
        return data[0][0] === 1;
      return validSolution(data);
    }
  };
};
