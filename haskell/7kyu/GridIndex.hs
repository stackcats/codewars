module GridIndex (gridIndex) where

gridIndex :: [[Char]] -> [Int] -> String
gridIndex mat = map ((xs !!) . pred)
 where
  xs = concat mat
