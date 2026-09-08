module SingleCharPalins where

solve :: String -> Bool
solve xs =
  let diff = (`div` 2) $ length $ filter (uncurry (/=)) $ zip xs $ reverse xs
   in if even $ length xs then diff == 1 else diff <= 1
