module Even (isEven) where

isEven :: Double -> Bool
isEven n
  | floor n /= ceiling n = False
  | floor n `rem` 2 == 0 = True
  | otherwise = False
