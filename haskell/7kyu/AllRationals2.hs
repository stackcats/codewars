module AllRationals where

ratAt :: Integer -> (Integer, Integer)
ratAt 0 = (1, 1)
ratAt n
  | odd n = (a, a + b)
  | otherwise = (a + b, b)
 where
  (a, b) = ratAt ((n - 1) `div` 2)

indexOf :: (Integer, Integer) -> Integer
indexOf (1, 1) = 0
indexOf (a, b)
  | a < b = 1 + 2 * indexOf (a, b - a)
  | otherwise = 2 + 2 * indexOf (a - b, b)
