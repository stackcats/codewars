module ListOfPresents.Kata (howManyGifts) where

import Data.List

howManyGifts :: Int -> [Int] -> Int
howManyGifts maxBudget gifts = go maxBudget $ sort gifts
 where
  go _ [] = 0
  go budget (x : xs)
    | x <= budget = 1 + go (budget - x) xs
    | otherwise = 0
