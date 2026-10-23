module CircleCipher (encode, decode) where

encode :: String -> String
encode s = take (length s) . concat . zipWith (\a b -> [a, b]) s $ reverse s

decode :: String -> String
decode = go [] []
 where
  go l r [] = reverse l ++ r
  go l r [x] = go (x : l) r []
  go l r (a : b : xs) = go (a : l) (b : r) xs
