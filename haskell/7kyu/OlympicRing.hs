module OlympicRing where

import Data.Char

data Medal = Bronze | Silver | Gold deriving (Eq, Enum, Show)

olympicRing :: String -> Maybe Medal
olympicRing s
  | score <= 1 = Nothing
  | score == 2 = Just Bronze
  | score == 3 = Just Silver
  | otherwise = Just Gold
 where
  score = (`div` 2) $ sum $ map f s
  f c
    | c `elem` "aAdDoObpPeRqQg" = 1
    | c == 'B' = 2
    | otherwise = 0
