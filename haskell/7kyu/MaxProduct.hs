module MaxProduct where

solve :: [[Int]] -> Int
solve (x : xs) = fst $ foldl f (maximum x, minimum x) xs
 where
  f (ma, mi) lst = (maximum possibilities, minimum possibilities)
   where
    curMa = maximum lst
    curMi = minimum lst
    possibilities = [a * b | a <- [ma, mi], b <- [curMa, curMi]]
solve [] = 1
