module TransposeTwoStrings (transposeTwoStrings) where

import Data.List
import Text.Printf

transposeTwoStrings :: [String] -> String
transposeTwoStrings ss = let (x : y : _) = ss in intercalate "\n" $ zip' x y
 where
  zip' [] [] = []
  zip' (x : xs) [] = printf "%c  " x : zip' xs []
  zip' [] (y : ys) = printf "  %c" y : zip' [] ys
  zip' (x : xs) (y : ys) = printf "%c %c" x y : zip' xs ys
