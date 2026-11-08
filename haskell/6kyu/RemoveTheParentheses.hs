module RemoveTheParentheses (removeParentheses) where

removeParentheses :: String -> String
removeParentheses = go []
 where
  go st [] = reverse st
  go [] (x : xs) = go [x] xs
  go st (')' : xs) = go st' xs
   where
    st' = tail $ dropWhile (/= '(') st
  go st (x : xs) = go (x : st) xs
