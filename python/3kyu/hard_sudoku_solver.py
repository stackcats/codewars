import copy

def check(arr, i, j, n):
  for x in range(9):
    if arr[i][x] == n or arr[x][j] == n:
      return False

  cellX = i - i % 3
  cellY = j - j % 3
  for i in range(cellX, cellX + 3):
    for j in range(cellY, cellY + 3):
      if arr[i][j] == n:
        return False

  return True

def dfs(arr, x, blank, ans):
  if x == len(blank):
    ans.append(copy.deepcopy(arr));
    return

  for n in range(1, 10):
    i = blank[x]['i']
    j = blank[x]['j']
    if check(arr, i, j, n):
      arr[i][j] = n
      dfs(arr, x + 1, blank, ans)
      arr[i][j] = 0
  return

def solve(board):
  arr = []
  ans = []
  for i in range(9):
    for j in range(9):
      if board[i][j] == 0:
        arr.append({ 'i': i, 'j': j})

  print arr
  dfs(board, 0, arr, ans)
  return ans[0]

problem = [[9, 0, 0, 0, 8, 0, 0, 0, 1],
           [0, 0, 0, 4, 0, 6, 0, 0, 0],
           [0, 0, 5, 0, 7, 0, 3, 0, 0],
           [0, 6, 0, 0, 0, 0, 0, 4, 0],
           [4, 0, 1, 0, 6, 0, 5, 0, 8],
           [0, 9, 0, 0, 0, 0, 0, 2, 0],
           [0, 0, 7, 0, 3, 0, 2, 0, 0],
           [0, 0, 0, 7, 0, 5, 0, 0, 0],
           [1, 0, 0, 0, 4, 0, 0, 0, 7]]

print solve(problem)
