module MyLanguages (Language, Score, myLanguages) where

import Data.List
import Data.Ord

type Language = String
type Score = Int

myLanguages :: [(Language, Score)] -> [Language]
myLanguages = map fst . sortOn (Down . snd) . filter ((>= 60) . snd)
