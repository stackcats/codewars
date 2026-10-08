module Haskell.Codewars.Pattern where

import Data.List

pattern :: Int -> String
pattern n
  | n <= 0 = ""
pattern n = intercalate "\n" $ reverse $ scanl (\acc i -> (acc ++) $ show $ n - i) (show n) [1 .. n - 1]
