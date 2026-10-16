module Will where

willYou :: Bool -> Bool -> Bool -> Bool
willYou y b l
  | y && b && not l = True
  | not (y && b) && l = True
  | otherwise = False
