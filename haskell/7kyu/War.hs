module War where

import Data.Maybe

alphabetWar :: String -> String
alphabetWar s =
  case uncurry compare t of
    LT -> "Right side wins!"
    GT -> "Left side wins!"
    _ -> "Let's fight again!"
 where
  left = [('w', 4), ('p', 3), ('b', 2), ('s', 1)]
  right = [('m', 4), ('q', 3), ('d', 2), ('z', 1)]
  power c group = fromMaybe 0 $ lookup c group
  t = foldl (\(l, r) c -> (l + power c left, r + power c right)) (0, 0) s
