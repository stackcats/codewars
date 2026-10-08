module UniqueStrChar where

solve :: String -> String -> String
solve xs ys = diff xs ys ++ diff ys xs

diff xs ys = filter (`notElem` ys) xs
