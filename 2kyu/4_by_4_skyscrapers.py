ROW = 4;
COL = 4;
MAX = ROW * COL;

def scanLeft(arr, ct):
  if ct == 0:
    return True;

  sum = 1
  i = 0
  j = i + 1
  while j < COL:
    if arr[i] < arr[j]:
      sum += 1
      i = j
    j += 1
  return sum == ct


def scanRight(arr, ct):
  if ct == 0:
    return True

  sum = 1;
  i = COL - 1
  j = i - 1
  while j >= 0:
    if arr[i] < arr[j]:
      sum += 1;
      i = j;
    j -= 1
        
  return sum == ct

def transpos(arr):
  tran = [];
  for i in range(ROW):
    tran.append([0] * COL)
    
  for i in range(len(arr)):
    for j in range(len(arr[i])):
      tran[j][i] = arr[i][j]

  return tran

def skyscraper(arr, rows, cols):
  for i in range(ROW):
    if not scanLeft(arr[i], rows[i][0]) or not scanRight(arr[i], rows[i][1]):
      return False

  tran = transpos(arr)
  for i in range(ROW):
    if not scanLeft(tran[i], cols[i][0]) or not scanRight(tran[i], cols[i][1]):
      return False
  return True

def check(arr, x, y):
  for i in range(y):
    if arr[x][y] == arr[x][i]:
      return False

  for i in range(x):
    if arr[x][y] == arr[i][y]:
      return False

  return True;

def dfs(arr, n, x, rows, cols):
  if n >= MAX:
    if skyscraper(arr, rows, cols):
      return arr
    return None

  row = n / COL
  col = n % ROW;
  arr[row][col] = x;
  if not check(arr, row, col):
    return None

  for i in range(1, ROW+1):
    ok = dfs(arr, n + 1, i, rows, cols)
    if ok:
      return ok

  return None

def solve_puzzle(clues):
  arr = [];
  for i in range(ROW):
    arr.append([0] * COL)

  rows = [
      [clues[15], clues[4]],
      [clues[14], clues[5]],
      [clues[13], clues[6]],
      [clues[12], clues[7]]
  ]

  cols = [
      [clues[0], clues[11]],
      [clues[1], clues[10]],
      [clues[2], clues[9]],
      [clues[3], clues[8]]
  ]

  for i in range(1, ROW+1):
    ok = dfs(arr, 0, i, rows, cols)
    if ok:
      return (tuple(ok[0]), tuple(ok[1]), tuple(ok[2]), tuple(ok[3]))
