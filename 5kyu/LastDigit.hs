module LastDigit where

lastDigit :: Integer -> Integer -> Integer
lastDigit _ 0 = 1
lastDigit 0 _ = 0
lastDigit a b
  | d `elem` [0, 1, 5, 6] = d
  | d `elem` [4, 9] = d ^ (b `myrem` 2) `rem` 10
  | otherwise = d ^ (b `myrem` 4) `rem` 10
 where
  d = a `rem` 10

myrem a b = let c = a `rem` b in if c == 0 then b else c
