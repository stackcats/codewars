def neighbors(board, dt, i, j):
    lst = []
    ROW = len(board)
    COL = len(board[0])

    dirs = [
        [-1, -1], [-1, 0], [-1, 1],
        [0, -1],           [0, 1],
        [1, -1],  [1, 0],  [1, 1],
    ];
    
    for [x, y] in dirs:
        x += i
        y += j
        if x >= 0 and x < ROW and y >= 0 and y < COL and dt[x][y] == 0:
            lst.append([x, y])
        
    return lst

def dfs(board, opt, x, y, word):
    if board[x][y] != word[0]:
        return False
    if len(word) == 1:
        return True

    lst = neighbors(board, opt, x, y)
    for [i, j] in lst:
        opt[i][j] = 1
        res = dfs(board, opt, i, j, word[1:])
        if res:
            return True
        opt[i][j] = 0

    return False

def find_word(board, word):
    ROW = len(board)
    COL = len(board[0])
    opt = []    
    for i in range(ROW):
        opt.append([0] * COL)
    
    for i in range(ROW):
        for j in range(COL):            
            res = dfs(board, opt, i, j, word)
            if res:
                return True
            
    return False
