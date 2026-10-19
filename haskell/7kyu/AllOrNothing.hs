module AllOrNothing (possiblyPerfect) where

possiblyPerfect :: String -> String -> Bool
possiblyPerfect xs ys = all id s1 || all id s2
 where
  s1 = zipWith (\a b -> a == '_' || b == '_' || a == b) xs ys
  s2 = zipWith (\a b -> a == '_' || b == '_' || a /= b) xs ys
