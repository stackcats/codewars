module YahtzeeUpper where

import Data.List

yahtzeeUpper :: [Int] -> Int
yahtzeeUpper dice = maximum $ map (\i -> sum $ filter (== i) dice) $ nub dice
