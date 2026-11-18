module SwapCaseUsingN (swap) where

import Data.Char
import Text.Printf

swap :: String -> Int -> String
swap s = go s . cycle . printf "%b"
 where
  go [] xs = []
  go (s : ss) (x : xs)
    | isAlpha s = f s x : go ss xs
    | otherwise = s : go ss (x : xs)

f c '1' = if isLower c then toUpper c else toLower c
f c _ = c
