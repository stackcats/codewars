module MaxSumBetweenTwoNegatives (maxSumBetweenTwoNegatives) where

import Data.List
import Data.List.Split

maxSumBetweenTwoNegatives :: [Int] -> Maybe Int
maxSumBetweenTwoNegatives xs
  | length ys < 2 = Nothing
  | otherwise = Just $ maximum $ map sum $ splitWhen (< 0) ys
 where
  ys = dropWhileEnd (>= 0) $ dropWhile (>= 0) xs
