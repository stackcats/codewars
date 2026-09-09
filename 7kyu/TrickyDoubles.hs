module TrickyDoubles (trickyDoubles) where

trickyDoubles :: Int -> Int
trickyDoubles n = if isTricky n then n else n * 2

isTricky n = a == b
 where
  s = show n
  len = length s
  (a, b) = splitAt (len `div` 2) s
