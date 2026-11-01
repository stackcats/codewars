module Codewars.Kata.Arpeggio where

arpeggio :: Char -> Maybe String
arpeggio x
  | x `notElem` ['A' .. 'G'] = Nothing
  | otherwise = Just $ map (xs !!) [0, 2, 4, 7]
 where
  xs = dropWhile (/= x) $ cycle ['A' .. 'G']
