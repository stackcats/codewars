module PairOfGloves (numberOfPairs) where

import Data.List
import Preloaded (Colour (..)) -- data Colour = Red | Blue | Green deriving (Show,Eq,Ord,Enum,Bounded)

numberOfPairs :: [Colour] -> Int
numberOfPairs = sum . map ((`div` 2) . length) . group . sort
