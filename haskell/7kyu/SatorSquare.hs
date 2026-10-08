module SatorSquare (isSatorSquare) where

import Data.List

isSatorSquare :: [[Char]] -> Bool
isSatorSquare mat = mat == transpose mat && mat2 == transpose mat2
 where
  mat2 = map reverse mat
