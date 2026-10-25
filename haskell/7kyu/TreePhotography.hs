module TreePhotography (treePhotography) where

treePhotography :: [Word] -> String
treePhotography xs
  | a > b = "left"
  | otherwise = "right"
 where
  go (x : xs) = fst $ foldl (\(ct, ma) n -> if ma < n then (ct + 1, n) else (ct, ma)) (0, x) xs
  a = go xs
  b = go $ reverse xs
