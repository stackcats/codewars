module Codewars.G964.Cycle1N where

import Data.List

cycli :: Int -> Int
cycli n
  | n `mod` 2 == 0 || n `mod` 5 == 0 = -1
  | otherwise = foldl1 lcm $ map (ord10 . product) $ group $ go [] 3 $ fromIntegral n
 where
  go :: [Integer] -> Integer -> Integer -> [Integer]
  go ans a b
    | a * a > b = b : ans
    | b `mod` a == 0 = go (a : ans) a (b `div` a)
    | otherwise = go ans (a + 2) b

  ord10 y = goMod 1 (10 `mod` y)
   where
    goMod k 1 = k
    goMod k r =
      let !k' = k + 1
          !r' = (r * 10) `mod` y
       in goMod k' r'
