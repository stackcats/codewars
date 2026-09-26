module OddEvenSort where

import Data.List

sortMyString :: String -> String
sortMyString s = map snd l ++ " " ++ map snd r
 where
  (l, r) = partition (even . fst) $ zip [0 ..] s
