module RLE where

import Data.List

runLengthEncoding :: String -> [(Int, Char)]
runLengthEncoding = map f . group
 where
  f lst@(x : _) = (length lst, x)
