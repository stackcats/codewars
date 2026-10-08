module SimpleStrRev where

solve :: String -> Int -> Int -> String
solve xs a b = l ++ (reverse $ take n r) ++ drop n r
 where
  (l, r) = splitAt a xs
  n = b - a + 1
