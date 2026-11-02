module Kata.Deadfish (parse) where

parse :: String -> [Int]
parse = reverse . snd . foldl f (0, [])
 where
  f (x, acc) c =
    case c of
      'i' -> (succ x, acc)
      'd' -> (pred x, acc)
      's' -> (x ^ 2, acc)
      'o' -> (x, x : acc)
      _ -> (x, acc)
