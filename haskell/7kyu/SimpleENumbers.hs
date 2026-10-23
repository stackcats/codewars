module SimpleENumbers where

solve :: Int -> Int -> Int
solve a b = length [n | n <- [a .. b - 1], isEviternity n]

isEviternity n = other == 0 && eight >= five && five >= three
 where
  s = show n
  eight = length $ filter (== '8') s
  five = length $ filter (== '5') s
  three = length $ filter (== '3') s
  other = length $ filter (`notElem` "853") s
