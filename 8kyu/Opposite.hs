module Kata where

import Data.Char

isOpposite :: String -> String -> Bool
isOpposite "" "" = False
isOpposite s1 s2 = isOpposite' s1 s2

isOpposite' :: String -> String -> Bool
isOpposite' "" "" = True
isOpposite' "" _ = False
isOpposite' _ "" = False
isOpposite' (x : xs) (y : ys)
  | toLower x == toLower y && x /= y = isOpposite' xs ys
  | otherwise = False
