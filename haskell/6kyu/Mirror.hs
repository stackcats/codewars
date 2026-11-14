module Mirror where

import Data.List
import Data.List.Split

mirror :: String -> String
mirror s = intercalate "\n" (edge : ys <> [edge])
 where
  xs = map reverse $ splitOn " " s
  maxLen = maximum $ map length xs
  ys = map (\x -> "* " <> padRight maxLen x <> " *") xs
  edge = replicate (maxLen + 4) '*'

padRight n s
  | length s < n = s <> replicate (n - length s) ' '
  | otherwise = s
