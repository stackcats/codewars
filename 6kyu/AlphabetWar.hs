module AlphabetWar where

import Data.Maybe

mp :: [(Char, Int)]
mp = [('w', 4), ('p', 3), ('b', 2), ('s', 1), ('m', -4), ('q', -3), ('d', -2), ('z', -1)]

alphabetWar :: String -> String
alphabetWar s
  | p > 0 = "Left side wins!"
  | p == 0 = "Let's fight again!"
  | otherwise = "Right side wins!"
 where
  p = sum $ map (\c -> fromMaybe 0 $ lookup c mp) $ filterBombs "" s

filterBombs :: String -> String -> String
filterBombs t [] = reverse t
filterBombs t ('*' : s) = filterBombs (drop' t) (drop' s)
filterBombs t (c : s) = filterBombs (c : t) s

drop' :: String -> String
drop' "" = ""
drop' ('*' : s) = '*' : s
drop' (_ : s) = '_' : s
