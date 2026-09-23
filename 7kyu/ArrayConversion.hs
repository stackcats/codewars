module ArrayConversion (arrayConversion) where

import Data.List.Split

arrayConversion :: [Int] -> Int
arrayConversion = f 0

f :: Int -> [Int] -> Int
f _ [x] = x
f n xs
  | even n = f m $ map sum ys
  | otherwise = f m $ map product ys
 where
  ys = chunksOf 2 xs
  m = succ n
