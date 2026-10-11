module CountSalutes (countSalutes) where

import Data.Function
import Data.List

countSalutes :: String -> Int
countSalutes = (* 2) . go 0 . dropWhileEnd (== '>') . dropWhile (== '<') . filter (/= '-')
 where
  go ct [] = 0
  go ct (x : xs)
    | x == '>' = go (succ ct) xs
    | otherwise = ct + go ct xs
