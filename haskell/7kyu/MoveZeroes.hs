module MoveZeroes where

import Data.List

move_zeroes :: Bool -> [Int] -> [Int]
move_zeroes isRight xs
  | isRight = nzs ++ zs
  | otherwise = zs ++ nzs
 where
  (zs, nzs) = partition (== 0) xs
