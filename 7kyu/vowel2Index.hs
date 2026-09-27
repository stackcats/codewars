module Switcheroo where

import Data.Bool

vowel2Index :: String -> String
vowel2Index = concatMap f . zip [1 ..]
 where
  f (i, c) = bool [c] (show i) (c `elem` "aeiouAEIUO")
