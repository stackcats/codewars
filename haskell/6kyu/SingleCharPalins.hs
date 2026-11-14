module SingleCharPalins where

solve :: String -> String
solve xs
  | isPal xs = "OK"
  | otherwise = case ys of
      [] -> "not possible"
      _ -> "remove one"
 where
  ys = [i | i <- [0 .. length xs - 1], let (l, r) = splitAt i xs, isPal (l <> tail r)]

isPal = (==) <*> reverse
