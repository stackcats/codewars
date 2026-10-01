module Kata (product') where

-- product is a function in Prelude therefore product' is used instead
product' :: String -> Int
product' = uncurry (*) . foldl f (0, 0)
 where
  f (a, b) c
    | c == '!' = (succ a, b)
    | c == '?' = (a, succ b)
    | otherwise = (a, b)
