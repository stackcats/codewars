module Odder (oddOne) where

import Data.List

oddOne :: [Int] -> Int
oddOne xs =
  case find (odd . abs . fst) $ zip xs [0 ..] of
    Nothing -> -1
    Just (_, i) -> i
