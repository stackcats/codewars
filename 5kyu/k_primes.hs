module Codewars.G964.Kprimes where

factor :: Int -> Int 
factor = factor' 2
  where
    factor' n m
      | n * n <= m = if m `mod` n == 0 then 1 + factor' n (m `div` n) else factor' (1 + n) m
      | m > 1 = 1
      | otherwise = 0
                 
countKprimes :: Int -> Int -> Int -> [Int]
countKprimes k start nd = filter (\x -> k == factor x) [start..nd]

puzzle :: Int -> Int
puzzle x = length [(a,b,c) | a <- as, b <- bs, c <- cs, a + b + c == x ]
    where as = countKprimes 1 1 x
          bs = countKprimes 3 1 x
          cs = countKprimes 7 1 x
