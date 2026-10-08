module Codewars.Kata.SequenceLength (lengthOfSequence) where

import Data.List

lengthOfSequence :: (Eq a) => [a] -> a -> Maybe Int
lengthOfSequence xs n
  | ct == 2 = Just $ length $ dropWhile (/= n) $ dropWhileEnd (/= n) xs
  | otherwise = Nothing
 where
  ct = length $ filter (== n) xs
