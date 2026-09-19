module GoingBackwards.Kata (number) where

number :: (Integral a) => [a] -> a
number [] = 0
number [n] = head [a * 10 + b | a <- [1 .. 9], b <- [0 .. 9], a + b == n]
number xs = foldl1 (\acc x -> acc * 10 + x) $ base : map (subtract base) a
 where
  total = sum xs
  (a : b : _) = group 1 [] $ reverse xs
  base = (sum (take 2 a) - head b) `div` 2

group n res [] = map reverse res
group n res xs = group (n + 1) (take n xs : res) (drop n xs)
