module SudokuBoardValidator (validateSudoku) where

import Data.List
import Data.Map qualified as Map

type Sudoku = [[Int]]

validateSudoku :: Sudoku -> Bool
validateSudoku m = all (\f -> f m) [checkRow, checkCol, checkBlc]

checkRow = all ((== [1 .. 9]) . sort)

checkCol = checkRow . transpose

checkBlc mat = checkRow [[mp Map.! (i + di, j + dj) | di <- [0 .. 2], dj <- [0 .. 2]] | i <- [0, 3, 6], j <- [0, 3, 6]]
 where
  mp = Map.fromList [((i, j), n) | (i, row) <- zip [0 ..] mat, (j, n) <- zip [0 ..] row]
