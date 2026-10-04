module Kata where

dative :: String -> String
dative word
  | x `elem` "eéiíöőüű" = word ++ "nek"
  | x `elem` "aáoóuú" = word ++ "nak"
  | otherwise = word
 where
  x = head $ dropWhile (`notElem` "aáoóuúeéiíöőüű") $ reverse word
