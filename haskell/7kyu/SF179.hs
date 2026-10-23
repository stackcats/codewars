module SF179 where

fraction :: (Int, Int) -> Int
fraction (a, b) = (a + b) `div` g
 where
  g = gcd a b
