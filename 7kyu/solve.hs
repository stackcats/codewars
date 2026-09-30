module Kata (solve) where

import Data.Char
import Data.List

solve :: String -> String
solve s = intercalate "," $ map f $ nub t
 where
  t = map toLower $ filter isAlpha s
  f c = c : ':' : replicate (length $ filter (== c) t) '*'
