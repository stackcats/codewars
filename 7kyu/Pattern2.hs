module Haskell.Codewars.Pattern where

import Data.List

pattern :: Int -> String
pattern n
  | n <= 0 = ""
  | otherwise = intercalate "\n" $ go 1 n
 where
  go a b
    | a > b = []
    | otherwise = concatMap show [a .. b] : go (succ a) b
