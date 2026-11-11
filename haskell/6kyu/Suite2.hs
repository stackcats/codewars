module Codewars.G964.Suite2 where

game :: Integer -> Either Integer (Integer, Integer)
game n
  | even n = Left $ m `div` 2
  | otherwise = Right (m, 2)
 where
  m = n ^ 2
