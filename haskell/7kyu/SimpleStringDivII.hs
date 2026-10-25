module SimpleStringDivII where

solve :: String -> Int -> Int
solve xs k = length [i | (i, x) <- ys, (j, y) <- ys, i /= j, read (x <> y) `mod` k == 0]
 where
  ys = zip [0 ..] $ words xs
