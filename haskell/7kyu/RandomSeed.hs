module RandomSeed (findRandomSeed) where

import System.Random

findRandomSeed :: [Int] -> Int
findRandomSeed lst = go 0
 where
  go seed
    | lst == take 10 (randomRs (0, 100) (mkStdGen seed)) = seed
    | otherwise = go $ succ seed
