module StringScramble (scramble) where

import Data.List

scramble :: String -> [Int] -> String
scramble a = map fst . sortOn snd . zip a
