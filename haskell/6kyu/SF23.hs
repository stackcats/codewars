module SF23 where

import Data.Char
import Data.Set qualified as Set

squareDigitsSequence :: Int -> Int
squareDigitsSequence = go mempty
 where
  go st n
    | Set.member n st = Set.size st + 1
    | otherwise = go (Set.insert n st) (next n)

  next = sum . map ((^ 2) . digitToInt) . show
