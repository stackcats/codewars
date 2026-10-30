module ReverseNumber where

reverseNumber :: Int -> Int -> Int
reverseNumber 0 _ = 0
reverseNumber n 1 = n
reverseNumber n b = foldr1 (\x acc -> acc * b + x) $ fst $ until ((== 0) . snd) f ([], n)
 where
  f (xs, x) = let (d, m) = x `divMod` b in (m : xs, d)
