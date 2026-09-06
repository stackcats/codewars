module GCDSum where

solve :: Int -> Int -> Maybe (Int, Int)
solve s g =
  case xs of
    [] -> Nothing
    (x : _) -> Just x
 where
  xs = [(a, b) | a <- [1 .. s], b <- [1 .. s], a + b == s, gcd a b == g]
