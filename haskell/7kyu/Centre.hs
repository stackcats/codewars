module Centre where

isInMiddle :: String -> Bool
-- your code goes below
isInMiddle s
  | length s < 3 = False
isInMiddle s = a == "abc" || ((even $ length s) && b == "abc")
 where
  (l, r) = splitAt (length s `div` 2) s
  a = last l : take 2 r
  b = reverse (take 2 (reverse l)) ++ take 1 r
