module Kata (reverseSlice) where

import Data.List

reverseSlice :: String -> [String]
reverseSlice = init . tails . reverse
