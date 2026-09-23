module Matrix where

matrix :: [[Int]] -> [[Int]]
matrix arr = zipWith f [0 ..] arr
 where
  change n = if n >= 0 then 1 else 0
  f i row = updateAt i change row

updateAt i f xs = lft ++ (f y) : ys
 where
  (lft, rht) = splitAt i xs
  (y : ys) = rht
