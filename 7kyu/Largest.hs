module CodeWars.Largest (largest) where

import Data.List
import Data.Ord

largest :: (Ord a) => Int -> [a] -> [a]
largest n = reverse . take n . sortOn Down
