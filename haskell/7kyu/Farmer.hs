module Farmer where

import Preloaded (AnimalCount (..))

-- data AnimalCount = AnimalCount
--   { rabbits  :: Int
--   , chickens :: Int
--   , cows     :: Int
--   } deriving (Show, Eq)

getAnimalsCount :: Int -> Int -> Int -> AnimalCount
getAnimalsCount legs heads horns = AnimalCount{rabbits, chickens, cows}
 where
  cows = horns `div` 2
  rabbits = (legs - 2 * cows - 2 * heads) `div` 2
  chickens = heads - cows - rabbits
