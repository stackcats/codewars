module MessageValidator (isAValidMessage) where

import Data.Char
import Data.List.Split

isAValidMessage :: [Char] -> Bool
isAValidMessage "" = True
isAValidMessage s = all f $ chunksOf 2 $ (split . dropBlanks . condense $ whenElt isDigit) s

f [n, s]
  | all isDigit n && all isAlpha s = read n == length s
  | otherwise = False
f _ = False
