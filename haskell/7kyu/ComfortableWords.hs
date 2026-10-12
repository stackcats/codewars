module ComfortableWords (comfortableWord) where

left = "qwertasdfgzxcvb"

comfortableWord :: String -> Bool
comfortableWord xs = all f . zip xs $ drop 1 xs
 where
  f (a, b) = g a b || g b a
  g a b = a `elem` left && b `notElem` left
