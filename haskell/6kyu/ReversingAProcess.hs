module ReversingAProcess (decode) where

import Data.Char

decode :: String -> Either String String
decode s = go [] $ map ((subtract 97) . ord) r
 where
  (l, r) = break isAlpha s

  n :: Int
  n = read l

  go ans [] = Right $ reverse ans
  go ans (x : xs) =
    case filter (\i -> i * n `mod` 26 == x) [0 .. 25] of
      [y] -> go (chr (y + 97) : ans) xs
      _ -> Left "Impossible to decode"
