module AStringOfSorts (sortString) where

import Data.List
import Data.Maybe

sortString :: String -> String -> String
sortString s1 s2 = map snd . sortBy f $ zip [0 ..] s1
 where
  f (i, a) (j, b) = case (i2, j2) of
    (Nothing, Nothing) -> compare i j
    (Nothing, _) -> GT
    (_, Nothing) -> LT
    (Just i', Just j') -> compare i' j'
   where
    i2 = findIndex (== a) s2
    j2 = findIndex (== b) s2
