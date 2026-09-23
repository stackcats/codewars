module ConsecutiveVowelsinaString (getTheVowels) where

getTheVowels :: String -> Int
getTheVowels = fst . foldl f (0, 'a')
 where
  f (acc, v) c
    | v == c = (succ acc, nextVowel v)
    | otherwise = (acc, v)

nextVowel c =
  case c of
    'a' -> 'e'
    'e' -> 'i'
    'i' -> 'o'
    'o' -> 'u'
    'u' -> 'a'
