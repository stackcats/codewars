module PopShift where

import Data.Maybe

popShift :: String -> (String, String, Maybe Char)
popShift s
  | even size = (reverse r, l, Nothing)
  | otherwise = (reverse $ drop 1 r, l, listToMaybe r)
 where
  size = length s
  (l, r) = splitAt (size `div` 2) s
