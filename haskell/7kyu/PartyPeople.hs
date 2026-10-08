module PartyPeople (partyPeople) where

import Data.List
import Data.Ord

partyPeople :: [Word] -> Word
partyPeople xs = foldl (\acc x -> if x > acc then acc - 1 else acc) (fromIntegral $ length $ xs) $ sortOn Down xs
