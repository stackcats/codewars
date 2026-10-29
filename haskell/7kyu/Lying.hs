module Lying where

isJohnLying :: (Int, Int) -> Int -> Bool
isJohnLying (a, b) s = t <= s && t `mod` 2 == s `mod` 2
 where
  t = abs a + abs b
