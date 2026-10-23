module SimpleStrDivision where

solve :: String -> Int -> Int
solve xs 0 = read xs
solve xs k
  | length xs <= k = 0
  | otherwise = maximum [max (read l) (solve r (k - 1)) | i <- [1 .. length xs - k], let (l, r) = splitAt i xs]
