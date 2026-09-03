module AnimalCalculator where

-- return a list of Integers that fit the description
solution :: Int -> [Int]
solution y = [y, cat y, dog y]
 where
  cat y
    | y == 1 = 15
    | y == 2 = 9 + cat (y - 1)
    | otherwise = 4 + cat (y - 1)
  dog y
    | y == 1 = 15
    | y == 2 = 9 + dog (y - 1)
    | otherwise = 5 + dog (y - 1)
