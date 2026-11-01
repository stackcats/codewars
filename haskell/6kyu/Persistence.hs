module Codewars.G.Persistence where

import Data.Char

persistence :: Int -> Int
persistence n
  | n < 10 = 0
  | otherwise = succ $ persistence $ product $ map digitToInt $ show n 
