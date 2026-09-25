module Codewars.PigLatin where

import Data.Char

pigLatin :: String -> Maybe String
pigLatin str
  | any (not . isAlpha) s = Nothing
  | all (`notElem` "aeiou") s = Just $ s ++ "ay"
  | head s `elem` "aeiou" = Just $ s ++ "way"
  | otherwise =
      let (l, r) = break (`elem` "aeiou") s
       in Just $ r ++ l ++ "ay"
 where
  s = map toLower str
