module Haskell.SylarDoom.MazeRunner where

import Data.List
import Data.Map qualified as Map
import Data.Maybe

mazeRunner :: [[Int]] -> [Char] -> [Char]
mazeRunner maze = go start
 where
  xs = [((i, j), c) | (i, row) <- zip [0 ..] maze, (j, c) <- zip [0 ..] row]
  start = fst $ fromJust $ find ((== 2) . snd) xs
  end = fst $ fromJust $ find ((== 3) . snd) xs
  mp = Map.fromList xs

  go _ [] = "Lost"
  go (i, j) (d : ds) =
    case Map.lookup k mp of
      Nothing -> "Dead"
      Just 1 -> "Dead"
      Just 3 -> "Finish"
      _ -> go k ds
   where
    k = case d of
      'N' -> (i - 1, j)
      'S' -> (i + 1, j)
      'E' -> (i, j + 1)
      'W' -> (i, j - 1)
