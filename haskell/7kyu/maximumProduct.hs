module MaxProduct where

import Data.List
import Data.Ord

maximumProduct :: [Integer] -> Integer
maximumProduct xs = fst $ head $ sortBy (comparing (Down . snd) <> comparing fst) $ zip xs $ map (product . (`delete` xs)) xs
