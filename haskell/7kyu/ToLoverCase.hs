module ToLoverCase where

import Data.Char

toLoverCase :: String -> String
toLoverCase = map f
  where
    f c
      | c `elem` ['a'..'z'] = "LOVE" !! ((ord c - ord 'a') `mod` 4)
      | c `elem` ['A'..'Z'] = "LOVE" !! ((ord c - ord 'A') `mod` 4)
      | otherwise = c
