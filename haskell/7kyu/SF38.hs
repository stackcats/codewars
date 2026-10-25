module SF38 where

houseOfCats :: Int -> [Int]
houseOfCats n = [p `div` 2 | c <- [maxCats, maxCats - 1 .. 0], let p = n - 4 * c, p >= 0, even p]
 where
  maxCats = n `div` 4
