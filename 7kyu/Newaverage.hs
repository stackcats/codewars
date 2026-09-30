module Codewars.G964.Newaverage where

newAvg :: [Double] -> Double -> Maybe Int
newAvg xs navg
  | n < 0 = Nothing
  | otherwise = Just $ ceiling n
 where
  n = navg * (fromIntegral $ length xs + 1) - sum xs
