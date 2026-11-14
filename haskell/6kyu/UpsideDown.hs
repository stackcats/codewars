module UpsideDown where

solve :: Int -> Int -> Int
solve a b = length $ filter f [a .. b - 1]

f :: Int -> Bool
f n
  | any (`notElem` "01689") m = False
  | otherwise = m == reverse (map rotate m)
 where
  m = show n

  rotate '6' = '9'
  rotate '9' = '6'
  rotate x = x
