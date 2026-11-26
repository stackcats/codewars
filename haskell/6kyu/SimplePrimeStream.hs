module SimplePrimeStream where

primes = go [2 .. 10000]
 where
  go [] = []
  go (x : xs) = (show x) <> go (filter ((/= 0) . (`mod` x)) xs)

solve :: Int -> Int -> String
solve a b = take b $ drop a $ primes
