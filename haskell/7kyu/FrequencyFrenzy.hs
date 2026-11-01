module FrequencyFrenzy where

import Data.List

frequency :: (Ord a) => [a] -> [(a, Int)]
frequency = map (\x -> (head x, length x)) . group . sort
