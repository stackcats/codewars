module Delete where

import Data.Char

deleteDigit :: Int -> Int
deleteDigit n = maximum $ map (\i -> let (l, r) = splitAt i s in read (l <> tail r)) [0 .. length s - 1]
 where
  s = show n
