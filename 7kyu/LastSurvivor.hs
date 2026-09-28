module LastSurvivor (lastSurvivor) where

lastSurvivor :: String -> [Int] -> Char
lastSurvivor s [] = head s
lastSurvivor s (x : xs) = lastSurvivor (l ++ drop 1 r) xs
 where
  (l, r) = splitAt x s
