module PisanoPeriod (pisano) where

pisano :: Int -> Int
pisano n = snd $ until ((== (0, 1)) . fst) (\(x, c) -> (f x, succ c)) ((1, 1), 1)
 where
  f (a, b) = (b, (a + b) `mod` n)
