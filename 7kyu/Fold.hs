module Codewars.Kata.Fold where

foldTo :: Double -> Maybe Int
foldTo distance
  | distance < 0 = Nothing
  | distance > 0.0001 = fmap (+ 1) $ foldTo $ distance / 2
  | otherwise = Just 0
